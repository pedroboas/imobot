import asyncio
import sys
from playwright.async_api import async_playwright
from adapters.factorvalor import parse_factorvalor
from adapters.idealista import parse_idealista
from adapters.generic import parse_generic_logic

# Map URLs to parsers
PARSERS = {
    "factorvalor.pt": parse_factorvalor,
    "idealista.pt": parse_idealista,
}

def get_parser(url):
    for domain, parser in PARSERS.items():
        if domain in url:
            return parser
    return parse_generic_logic

async def debug_url(url):
    print(f"Debugging URL: {url}")
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=False)
        context = await browser.new_context(
            user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
        )
        page = await context.new_page()
        
        try:
            await page.goto(url, timeout=60000, wait_until="domcontentloaded")
            await page.wait_for_timeout(5000) # Wait for JS
            
            content = await page.content()
            print(f"HTML Content Length: {len(content)}")
            
            parser = get_parser(url)
            print(f"Using Parser: {parser.__name__}")
            
            results = parser(content)
            
            print(f"\nFound {len(results)} properties:")
            for i, prop in enumerate(results):
                print(f"{i+1}. {prop['title']} - {prop['price']} ({prop['url']})")
                
            if len(results) == 0:
                print("\nWARNING: No results found. Dumping HTML to debug_output.html")
                with open("debug_output.html", "w") as f:
                    f.write(content)
                    
        except Exception as e:
            print(f"Error: {e}")
        finally:
            await browser.close()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 debug_parser.py <url>")
    else:
        asyncio.run(debug_url(sys.argv[1]))
