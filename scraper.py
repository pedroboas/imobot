"""
Web Scraper for Real Estate Listings
------------------------------------
This script orchestrates the scraping of multiple real estate portals using Playwright (Async).
It identifies new listings, filters them by price, saves them to a database, and sends
notifications via Telegram.

Architecture:
- Asynchronous execution with Producer-Consumer pattern.
- BrowserManager for resilient browser handling (auto-restart on crash).
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
from adapters.franciscofaria import parse_franciscofaria
from adapters.factorvalor import parse_factorvalor
from adapters.generic import parse_generic_logic

# Load environment variables
load_dotenv()

# Configuration
TELEGRAM_TOKEN = os.getenv("TELEGRAM_TOKEN")
CHAT_ID = os.getenv("CHAT_ID")
BROWSER_WS_ENDPOINT = os.getenv("BROWSER_WS_ENDPOINT")
SCRAPE_INTERVAL = int(os.getenv("SCRAPE_INTERVAL", "3600"))
CONCURRENCY_LIMIT = int(os.getenv("CONCURRENCY_LIMIT", "2"))
MIN_PRICE = int(os.getenv("MIN_PRICE", "100000"))
LINKS_FILE = "links"

# File paths
LOG_FILE = "scraper.log"
TRIGGER_FILE = "trigger.flag"

# Logging setup
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S',
    handlers=[
        logging.StreamHandler(),
        logging.FileHandler(LOG_FILE)
    ]
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
    "franciscofaria.pt": parse_franciscofaria,
    "factorvalor.pt": parse_factorvalor,
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
    url_lower = url.lower()
    for domain, parser_func in PARSERS.items():
        if domain in url_lower:
            return parser_func
    return None

def clean_price_value(price_str):
    if not price_str or "consulta" in price_str.lower():
        return 0
    numeric_str = "".join(re.findall(r'\d+', price_str))
    try:
        return int(numeric_str) if numeric_str else 0
    except ValueError:
        return 0

class BrowserManager:
    def __init__(self):
        self._playwright = None
        self._browser = None
        self._lock = asyncio.Lock()
    
    async def start(self):
        async with self._lock:
            if not self._playwright:
                self._playwright = await async_playwright().start()
            
            if not self._browser or not self._browser.is_connected():
                logger.info("Iniciando Browser...")
                try:
                    if BROWSER_WS_ENDPOINT:
                        logger.info(f"Conectando ao browser em {BROWSER_WS_ENDPOINT}...")
                        self._browser = await self._playwright.chromium.connect_over_cdp(BROWSER_WS_ENDPOINT)
                    else:
                        logger.info("Iniciando browser local (headless)...")
                        self._browser = await self._playwright.chromium.launch(headless=True)
                except Exception as e:
                    logger.error(f"Falha no arranque do browser: {e}")
                    raise

    async def get_browser(self):
        if not self._browser or not self._browser.is_connected():
            await self.start()
        return self._browser

    async def restart(self):
        logger.warning("Reiniciando BrowserManager...")
        async with self._lock:
            if self._browser:
                try:
                    await self._browser.close()
                except:
                    pass
            self._browser = None
        await self.start()

    async def stop(self):
        if self._browser:
            await self._browser.close()
        if self._playwright:
            await self._playwright.stop()

async def scrape_site(browser_manager, search_url, counter_text):
    max_retries = 3
    
    for attempt in range(max_retries):
        context = None
        page = None
        try:
            browser = await browser_manager.get_browser()
            
            # Context creation
            context = await browser.new_context(
                user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
                viewport={'width': 1920, 'height': 1080},
                locale="pt-PT",
                timezone_id="Europe/Lisbon",
                extra_http_headers={
                    "Accept-Language": "pt-PT,pt;q=0.9,en-US;q=0.8,en;q=0.7",
                    "Upgrade-Insecure-Requests": "1"
                }
            )
            
            page = await context.new_page()
            
            attempt_str = f" (Tentativa {attempt+1}/{max_retries})" if attempt > 0 else ""
            logger.info(f"{counter_text}{attempt_str} Verificando: {search_url}")
            
            try:
                await page.goto(search_url, wait_until="load", timeout=90000)
            except Exception as e:
                if "Target page, context or browser has been closed" in str(e):
                    raise Exception("Browser disconnected during navigation")
                raise e

            # Specific wait for FactorValor (Dynamic Loading)
            if "factorvalor.pt" in search_url:
                try:
                    logger.info("Aguardando carregamento dinâmico (FactorValor)...")
                    # Wait for at least one property item to appear
                    await page.wait_for_selector(".propertyItem", timeout=30000)
                except:
                    logger.warning(f"Timeout ao aguardar elementos no FactorValor: {search_url}")

            await asyncio.sleep(2)
            
            # Auto-scroll
            for i in range(3):
                try:
                    await page.evaluate(f"window.scrollTo(0, document.body.scrollHeight * {i+1} / 3)")
                except:
                    pass
                await asyncio.sleep(1)

            content = await page.content()
            
            parser_func = get_parser(search_url)
            parser_name = parser_func.__name__ if parser_func else "parse_generic_logic"
            
            logger.info(f"[{parser_name}] HTML Len: {len(content)}")

            if parser_func:
                found_properties = parser_func(content)
            else:
                found_properties = parse_generic_logic(content, search_url)

            # Check for generic "blocked" signals if 0 results
            if len(found_properties) == 0:
                if "captcha" in content.lower() or "acesso negado" in content.lower() or "access denied" in content.lower():
                     logger.warning(f"BLOCKED: {search_url}")
                     return {"url": search_url, "status": "❌", "found": 0, "new": 0, "error": "Blocked/Captcha"}

            valid_properties = []
            for prop in found_properties:
                price_val = clean_price_value(prop['price'])
                if price_val >= MIN_PRICE:
                    valid_properties.append(prop)

            if not found_properties:
                logger.warning(f"[AVISO] {search_url} | {parser_name} | 0 encontros")
                # Debug: Dump HTML for investigation
                domain = search_url.split('/')[2]
                filename = f"debug_{domain}.html"
                with open(filename, "w", encoding="utf-8") as f:
                    f.write(content)
                logger.info(f"HTML of {domain} dumped to {filename}")
            else:
                logger.info(f"[SUCESSO] {search_url} | {parser_name} | Total: {len(found_properties)} | Válidos: {len(valid_properties)}")

            new_count_site = 0
            for prop in valid_properties:
                try:
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
                except Exception as e_db:
                    logger.error(f"Erro DB/Telegram: {e_db}")
            
            return {"url": search_url, "status": "✅", "found": len(found_properties), "new": new_count_site}

        except Exception as e:
            error_msg = str(e)
            is_connection_error = any(x in error_msg.lower() for x in ["closed", "connection", "reset", "disconnected", "target"])
            
            if is_connection_error:
                logger.warning(f"[CRITICAL] Browser Error: {error_msg}. Restarting manager...")
                await browser_manager.restart()
                # If we have retries left, continue loop
                if attempt < max_retries - 1:
                    await asyncio.sleep(5)
                    continue
            
            # Normal loop retry for other errors
            if attempt < max_retries - 1:
                logger.warning(f"[RETRY] {search_url}: {error_msg}. Sleeping...")
                await asyncio.sleep(5)
                continue
            
            return {"url": search_url, "status": "❌", "found": 0, "new": 0, "error": error_msg[:50]}
            
        finally:
            if context:
                try: await context.close()
                except: pass

async def worker(name, queue, browser_manager, results):
    logger.info(f"Worker {name} started.")
    while True:
        try:
            item = queue.get_nowait()
        except asyncio.QueueEmpty:
            break
            
        url, index, total = item
        counter_text = f"[{index+1}/{total}]"
        
        try:
            res = await scrape_site(browser_manager, url, counter_text)
            results.append(res)
        except Exception as e:
            logger.error(f"Worker {name} failed on {url}: {e}")
            results.append({"url": url, "status": "❌", "found": 0, "new": 0, "error": str(e)})
        finally:
            queue.task_done()

async def run_scraper():
    logger.info("Iniciando nova pesquisa (Async/Queue)...")

    if not os.path.exists(LINKS_FILE):
        logger.error(f"Arquivo '{LINKS_FILE}' não encontrado.")
        return

    with open(LINKS_FILE, 'r') as f:
        links = [line.strip() for line in f if line.strip() and not line.strip().startswith('#')]

    if not links:
        logger.warning("Nenhum link encontrado.")
        return

    browser_manager = BrowserManager()
    await browser_manager.start()
    
    try:
        queue = asyncio.Queue()
        total_links = len(links)
        
        for i, url in enumerate(links):
            queue.put_nowait((url, i, total_links))
            
        results = []
        workers = []
        for i in range(CONCURRENCY_LIMIT):
            task = asyncio.create_task(worker(f"W-{i+1}", queue, browser_manager, results))
            workers.append(task)
            
        await asyncio.gather(*workers)
        
        # Summary
        total_new_found = sum(r['new'] for r in results)
        logger.info("="*50)
        logger.info("RELATÓRIO DE VERIFICAÇÃO FINAL:")
        
        summary_lines = ["📋 <b>Resumo de Verificação:</b>", ""]
        
        for r in results:
            if r['status'] == "✅":
                logger.info(f"{r['status']} {r['url']} - Encontrados: {r['found']} (Novos: {r['new']})")
                summary_lines.append(f"{r['status']} {r['url'][:40]}... <b>({r['found']})</b>")
            else:
                logger.info(f"{r['status']} {r['url']} - Erro: {r.get('error')}")
                summary_lines.append(f"❌ {r['url'][:40]}... (<i>{r.get('error')}</i>)")
        
        logger.info("="*50)

        final_msg = (
            f"✅ <b>Ciclo Completo (Queue)</b>\n"
            f"Novas Casas: <b>{total_new_found}</b>\n\n"
            + "\n".join(summary_lines)
        )
        
        # Summary report is only logged, not sent to Telegram anymore as per user request
        # await send_telegram_message(final_msg[:4090]) 
        logger.info(f"Ciclo concluído. {total_new_found} novas casas no total.")

    finally:
        await browser_manager.stop()

async def async_main():
    if not await wait_for_db():
        logger.critical("Não foi possível ligar à base de dados. Encerrando.")
        return

    while True:
        # Check for manual trigger
        if os.path.exists(TRIGGER_FILE):
            logger.info("Trigger manual detectado!")
            os.remove(TRIGGER_FILE)

        try:
            await run_scraper()
        except Exception as e:
            logger.exception(f"Erro no loop principal: {e}")
            
        logger.info(f"Próxima verificação em {SCRAPE_INTERVAL} segundos...")
        
        wait_time = SCRAPE_INTERVAL
        while wait_time > 0:
            if os.path.exists(TRIGGER_FILE):
                break
            await asyncio.sleep(5)
            wait_time -= 5

if __name__ == "__main__":
    asyncio.run(async_main())
