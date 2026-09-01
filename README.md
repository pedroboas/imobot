# imobot

Real estate scraping and monitoring engine for Portuguese property portals. Uses Playwright for headless browser automation, PostgreSQL for listing persistence, and sends real-time notifications via Telegram.

## Architecture

The project consists of four main components managed via Docker Compose:

1. **Scraper (`scraper.py`)**: Asynchronous worker running periodic scraping cycles across configured search URLs. Intercepts dynamic network requests, renders JavaScript-heavy SPAs, extracts listing details, and filters out duplicates against PostgreSQL.
2. **Browserless (`imobot_browser`)**: Isolated headless Chromium instance used by Playwright for page rendering and anti-detection.
3. **Database (`imobot_db`)**: PostgreSQL database storing listings (`properties`), per-URL scrape execution logs (`scrape_logs`), and cycle summaries (`run_summaries`).
4. **Dashboard (`dashboard/`)**: FastAPI application providing WebSocket-based live log streaming, scrape metrics, and manual cycle execution.

## Supported Portals

- RE/MAX (`remax.pt`)
- ERA Imobiliária (`era.pt`)
- Imovirtual (`imovirtual.com`)
- OLX (`olx.pt`)
- iad Portugal (`iadportugal.pt`)
- Grupo Mérito (`grupomerito.pt`)
- Zome (`zome.pt`)
- Decisões e Soluções (`decisoesesolucoes.com`)
- Francisco Faria, Lar de Sonho, Factor Valor, H-Urb, Barcelcasa, H-Aconchego, Casa Sapo
- Generic fallback parser for other real estate websites

## Configuration

Configuration is managed through environment variables or a `.env` file:

| Variable | Description | Example |
| --- | --- | --- |
| `DATABASE_URL` | PostgreSQL connection string | `postgresql://user:pass@imobot_db:5432/imoveis` |
| `TELEGRAM_TOKEN` | Telegram bot API token | `your_bot_token_here` |
| `CHAT_ID` | Telegram chat or channel ID(s) (comma-separated) | `your_chat_id_here` |
| `BROWSER_WS_ENDPOINT` | Playwright WebSocket endpoint for remote Chromium | `ws://imobot_browser:3000/chromium/playwright` |
| `SCRAPE_INTERVAL` | Seconds between scrape cycles | `1800` |
| `CONCURRENCY_LIMIT` | Maximum concurrent page workers | `2` |
| `MIN_PRICE` | Minimum price filter in euros | `100000` |

### Search URLs

Add the target search URLs directly to the `links` file, one URL per line:

```text
https://www.remax.pt/pt/comprar/imoveis/...
https://www.era.pt/comprar?...
https://www.imovirtual.com/pt/resultados/...
```

## Running the Application

### Production (Docker Compose)

```bash
# Start all services
docker compose -f docker-compose.server.yml up -d --build

# View scraper logs
docker compose -f docker-compose.server.yml logs -f scraper

# Stop services
docker compose -f docker-compose.server.yml down
```

The web dashboard is exposed on port `8085` by default (`http://localhost:8085`).

### Local Development

```bash
# Install dependencies
pip install -r requirements.txt
playwright install chromium

# Run scraper
python scraper.py

# Run dashboard
python dashboard/app.py
```

## Adding a New Portal

1. Create a parser in `adapters/<site_name>.py`:
   ```python
   def parse_myportal(html_content):
       # Extract properties returning a list of dicts:
       # [{'id': '123', 'title': '...', 'price': '250.000 €', 'url': '...', 'site': 'myportal'}]
       return properties
   ```
2. Register the parser in `scraper.py` inside `PARSERS` and `SITE_WAIT_SELECTORS`.
3. Add your target search URL to the `links` file.

## License

MIT
