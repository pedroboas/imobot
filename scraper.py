"""
Web Scraper for Real Estate Listings
------------------------------------
This script orchestrates the scraping of multiple real estate portals using Playwright (Async).
It identifies new listings, filters them by price, saves them to a database, and sends
notifications via Telegram.

Architecture:
- Asynchronous execution with concurrency control (Semaphore).
- Registry-based parser selection.
- Robust error handling with automated retries.
"""

import os
import asyncio
import time
import requests
import html
import logging
import random
import re
from playwright.async_api import async_playwright
from dotenv import load_dotenv

# Import local modules for database and specialized site adapters
from database import init_db, is_property_new, save_property
from adapters.imovirtual import parse_imovirtual
from adapters.idealista import parse_idealista
from adapters.olx import parse_olx
from adapters.custojusto import parse_custojusto
from adapters.casasapo import parse_casasapo
from adapters.remax import parse_remax
from adapters.zome import parse_zome
from adapters.era import parse_era
from adapters.generic import parse_generic_logic

# Load environment variables
load_dotenv()

# Configuration
TELEGRAM_TOKEN = os.getenv("TELEGRAM_TOKEN")
CHAT_ID = os.getenv("CHAT_ID")
BROWSER_WS_ENDPOINT = os.getenv("BROWSER_WS_ENDPOINT")
SCRAPE_INTERVAL = int(os.getenv("SCRAPE_INTERVAL", "3600"))
CONCURRENCY_LIMIT = int(os.getenv("CONCURRENCY_LIMIT", "3"))
MIN_PRICE = int(os.getenv("MIN_PRICE", "100000"))
LINKS_FILE = "links"

# Logging setup
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)

# Parser Registry
PARSERS = {
    "imovirtual.com": parse_imovirtual,
    "idealista.pt": parse_idealista,
    "olx.pt": parse_olx,
    "custojusto.pt": parse_custojusto,
    "casa.sapo.pt": parse_casasapo,
    "remax.pt": parse_remax,
    "zome.pt": parse_zome,
    "era.pt": parse_era,
}

def send_telegram_message_sync(message):
    if not TELEGRAM_TOKEN or not CHAT_ID:
        logger.warning("Telegram credentials missing, skipping notification.")
        return

    url = f"https://api.telegram.org/bot{TELEGRAM_TOKEN}/sendMessage"
    payload = {
        "chat_id": CHAT_ID,
        "text": message,
        "parse_mode": "HTML"
    }
    
    for attempt in range(3):
        try:
            response = requests.post(url, json=payload, timeout=10)
            if response.status_code == 429:
                retry_after = int(response.headers.get("Retry-After", 5))
                logger.info(f"Telegram Rate Limit (429). Sleeping for {retry_after}s...")
                time.sleep(retry_after)
                continue
                
            response.raise_for_status()
            time.sleep(1.0) 
            return
        except Exception as e:
            logger.error(f"Failed to send Telegram message (attempt {attempt+1}): {e}")
            time.sleep(2)

async def send_telegram_message(message):
    return await asyncio.to_thread(send_telegram_message_sync, message)

async def wait_for_db():
    logger.info("Aguardando base de dados ficar pronta...")
    for attempt in range(1, 11):
        try:
            await asyncio.to_thread(init_db)
            logger.info("Base de dados ligada com sucesso!")
            return True
        except Exception as e:
            logger.error(f"Erro ao ligar à DB (tentativa {attempt}/10): {e}")
            await asyncio.sleep(5)
    return False

def get_parser(url):
    """
    Identifies the appropriate parser function based on the URL domain.
    Returns the specific adapter function or parse_generic_logic as fallback.
    """
    url_lower = url.lower()
    for domain, parser_func in PARSERS.items():
        if domain in url_lower:
            return parser_func
    return None

def clean_price_value(price_str):
    """
    Normalizes a price string to an integer for numerical filtering.
    Example: '240.000 €' -> 240000.
    """
    if not price_str or "consulta" in price_str.lower():
        return 0
    
    # Remove all non-numeric characters to get the raw value
    numeric_str = "".join(re.findall(r'\d+', price_str))
    
    try:
        return int(numeric_str) if numeric_str else 0
    except ValueError:
        return 0

import random
import re

async def scrape_site(browser, search_url, semaphore, counter_text):
    # Add a random initial delay to stagger starts and avoid anti-bot detection
    delay = random.uniform(2, 7)
    await asyncio.sleep(delay)
    
    max_retries = 2
    for attempt in range(max_retries):
        async with semaphore:
            context = None
            try:
                context = await browser.new_context(
                    user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
                    viewport={'width': 1920, 'height': 1080},
                    locale="pt-PT",
                    timezone_id="Europe/Lisbon",
                    extra_http_headers={
                        "Accept-Language": "pt-PT,pt;q=0.9,en-US;q=0.8,en;q=0.7",
                        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
                        "Sec-Fetch-Dest": "document",
                        "Sec-Fetch-Mode": "navigate",
                        "Sec-Fetch-Site": "none",
                        "Sec-Fetch-User": "?1",
                        "Upgrade-Insecure-Requests": "1"
                    }
                )
                page = await context.new_page()
                
                attempt_str = f" (Tentativa {attempt+1}/{max_retries})" if attempt > 0 else ""
                logger.info(f"{counter_text}{attempt_str} Verificando: {search_url}")
                
                await page.goto(search_url, wait_until="networkidle", timeout=60000)
                
                # Scroll to trigger lazy loading
                for i in range(3):
                    await page.evaluate(f"window.scrollTo(0, document.body.scrollHeight * {i+1} / 3)")
                    await asyncio.sleep(1.5)
                
                content = await page.content()
                parser_func = get_parser(search_url)
                parser_name = parser_func.__name__ if parser_func else "parse_generic_logic"
                
                if parser_func:
                    found_properties = parser_func(content)
                else:
                    found_properties = parse_generic_logic(content, search_url)

                # Filter by MIN_PRICE
                valid_properties = []
                for prop in found_properties:
                    price_val = clean_price_value(prop['price'])
                    if price_val >= MIN_PRICE:
                        valid_properties.append(prop)
                    else:
                        logger.debug(f"Skipping {prop['title']} - Price {prop['price']} below MIN_PRICE")

                logger.info(f"[SUCESSO] {search_url} | Parser: {parser_name} | Encontrados: {len(valid_properties)} (Filtro Preço: {len(found_properties) - len(valid_properties)} removidos)")

                new_count_site = 0
                for prop in valid_properties:
                    is_new = await asyncio.to_thread(is_property_new, prop['id'])
                    if is_new:
                        logger.info(f"NOVA PROPRIEDADE: {prop['title']} - {prop['price']}")
                        await asyncio.to_thread(
                            save_property, prop['id'], prop['site'], prop['title'], prop['url'], prop['price']
                        )
                        
                        msg = (
                            "🏠 <b>Nova Casa Encontrada!</b>\n\n"
                            f"<b>Título:</b> {html.escape(prop['title'])}\n"
                            f"<b>Preço:</b> {html.escape(prop['price'])}\n"
                            f"<b>Site:</b> {prop['site']}\n\n"
                            f"<a href='{html.escape(prop['url'])}'>Ver no site</a>"
                        )
                        await send_telegram_message(msg)
                        new_count_site += 1
                
                return {"url": search_url, "status": "✅", "found": len(found_properties), "new": new_count_site}

            except Exception as e:
                error_msg = str(e).split('\n')[0]
                is_connection_error = any(msg in error_msg.lower() for msg in ["closed", "connection", "reset", "target"])
                
                if attempt < max_retries - 1 and is_connection_error:
                    logger.warning(f"[RETRY] {search_url}: Ligação encerrada. Tentando novamente em 5s...")
                    if context:
                        try: await context.close()
                        except: pass
                    await asyncio.sleep(5)
                    continue
                
                # Clean up common playwright error messages for the user
                if "Timeout" in error_msg:
                    error_summary = "Timeout (60s)"
                elif "closed" in error_msg.lower():
                    error_summary = "Ligação Fechada"
                elif "denied" in error_msg.lower() or "forbidden" in error_msg.lower():
                    error_summary = "Bloqueado (403)"
                else:
                    error_summary = error_msg[:30]
                    
                logger.error(f"[FALHA] {search_url}: {error_msg}")
                return {"url": search_url, "status": "❌", "found": 0, "new": 0, "error": error_summary}
            finally:
                if context:
                    try: await context.close()
                    except: pass

async def run_scraper():
    logger.info("Iniciando nova pesquisa (Async)...")

    if not os.path.exists(LINKS_FILE):
        logger.error(f"Arquivo '{LINKS_FILE}' não encontrado.")
        return

    with open(LINKS_FILE, 'r') as f:
        links = [line.strip() for line in f if line.strip()]

    async with async_playwright() as p:
        async def get_browser():
            if BROWSER_WS_ENDPOINT:
                logger.info(f"Conectando ao browser em {BROWSER_WS_ENDPOINT}...")
                return await p.chromium.connect_over_cdp(BROWSER_WS_ENDPOINT)
            logger.info("Iniciando browser local...")
            return await p.chromium.launch()

        browser = None
        try:
            browser = await get_browser()
            semaphore = asyncio.Semaphore(CONCURRENCY_LIMIT)
            total_links = len(links)
            
            tasks = [scrape_site(browser, url, semaphore, f"[{i+1}/{total_links}]") for i, url in enumerate(links)]
            results = await asyncio.gather(*tasks)
            
            total_new_found = sum(r['new'] for r in results)
            
            # Detailed Summary in Logs
            logger.info("="*50)
            logger.info("RELATÓRIO DE VERIFICAÇÃO FINAL:")
            
            # Telegram Summary Construction
            summary_lines = [
                "📋 <b>Resumo de Verificação:</b>",
                ""
            ]
            
            for r in results:
                if r['status'] == "✅":
                    logger.info(f"{r['status']} {r['url']} - Encontrados: {r['found']} (Novos: {r['new']})")
                    summary_lines.append(f"{r['status']} {r['url'][:40]}... <b>({r['found']})</b>")
                else:
                    logger.info(f"{r['status']} {r['url']} - Erro: {r.get('error')}")
                    summary_lines.append(f"❌ {r['url'][:40]}... (<i>{r.get('error')}</i>)")
            
            logger.info("="*50)

            final_msg = (
                f"✅ <b>Ciclo Completo (Async)</b>\n"
                f"Novas Casas: <b>{total_new_found}</b>\n\n"
                + "\n".join(summary_lines)
            )
            
            await send_telegram_message(final_msg[:4090]) 
            logger.info(f"Ciclo concluído. {total_new_found} novas casas no total.")

        finally:
            if browser:
                try: await browser.close()
                except: pass

async def async_main():
    if not await wait_for_db():
        logger.critical("Não foi possível ligar à base de dados. Encerrando.")
        return

    while True:
        try:
            await run_scraper()
        except Exception as e:
            logger.exception(f"Erro inesperado durante a execução do scraper: {e}")
            
        logger.info(f"Próxima verificação em {SCRAPE_INTERVAL} segundos...")
        await asyncio.sleep(SCRAPE_INTERVAL)

if __name__ == "__main__":
    asyncio.run(async_main())
