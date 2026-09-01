# 🏠 ImoBot — Advanced Real Estate Scraper & Notification Engine

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.11+-blue.svg" alt="Python 3.11+">
  <img src="https://img.shields.io/badge/Playwright-Headless_Chromium-green.svg" alt="Playwright">
  <img src="https://img.shields.io/badge/Database-PostgreSQL_15-336791.svg" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/UI-FastAPI_+_WebSockets-009688.svg" alt="FastAPI">
  <img src="https://img.shields.io/badge/Alerts-Telegram_Bot-2CA5E0.svg" alt="Telegram">
  <img src="https://img.shields.io/badge/Docker-Ready-2496ED.svg" alt="Docker">
</p>

An asynchronous, production-ready web scraping and monitoring system built to track real estate opportunities across major Portuguese property portals. Features dynamic JavaScript rendering, Next.js API interception, anti-bot evasion, duplicate deduplication in PostgreSQL, real-time Telegram photo alerts, and a live web dashboard.

---

## ✨ Key Features

- ⚡ **Asynchronous High Concurrency**: Parallelized scraping powered by Python `asyncio` and `playwright.async_api` with configurable concurrency limits.
- 🛡️ **Anti-Bot & Dynamic JS Rendering**: Headless Chromium instance handling client-side SPA rendering, automated cookie consent dismissal, and human-like interaction.
- 🔍 **Next.js & Network API Interception**: Intercepts background JSON endpoints (e.g. RE/MAX internal search APIs) for exact listing data, structured prices, and high-res images.
- 📸 **Rich Telegram Alerts with Photos**: Sends real-time cards to Telegram containing property photos, price formatting, typology tags (T1, T2, T3...), portal badges, and direct links.
- 📊 **Real-Time Monitoring Dashboard**: Built with FastAPI & WebSockets:
  - Live log streaming directly in the browser
  - Scrape metrics (found, valid, new properties, cycle duration, success rates)
  - Historical property database search and inspection
  - One-click manual scrape trigger button
- 💾 **Robust PostgreSQL Persistence**: Full deduplication using SQLAlchemy models (`Property`, `ScrapeLog`, `RunSummary`), automatic schema migrations, and indexing.
- 🧩 **Extensible Modular Adapters**: 15+ specialized portal parsers with an intelligent fallback heuristic engine for any real estate website.

---

## 🏛️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                          ImoBot                             │
├──────────────────────────────┬──────────────────────────────┤
│  Browserless / Chromium      │  FastAPI Web Dashboard       │
│  (Isolated Headless Browser) │  (Metrics + WebSocket Logs)  │
├──────────────────────────────┼──────────────────────────────┤
│  Scraper Orchestrator        │  PostgreSQL Database         │
│  (Network Intercept + Anti-  │  (Properties, RunSummaries,  │
│   Detection + Dynamic DOM)   │   ScrapeLogs)                │
└──────────────┬───────────────┴──────────────┬───────────────┘
               │                              │
               ▼                              ▼
      Real Estate Portals              Telegram Bot Alerts
   (RE/MAX, ERA, OLX, iad...)         (Instant Photo Cards)
```

---

## 🌐 Supported Portals & Adapters

| Portal | Status | Specialized Features |
| :--- | :---: | :--- |
| **RE/MAX** (`remax.pt`) | ✅ Active | Next.js API interception + dynamic card selectors |
| **iad Portugal** (`iadportugal.pt`) | ✅ Active | Complete catalog extraction with direct property IDs |
| **Grupo Mérito** (`grupomerito.pt`) | ✅ Active | Specialized parser for regional Minho/Barcelos listings |
| **ERA Imobiliária** (`era.pt`) | ✅ Active | Dynamic card parsing & gallery extraction |
| **Imovirtual** (`imovirtual.com`) | ✅ Active | Next-gen card parser & price normalization |
| **OLX Portugal** (`olx.pt`) | ✅ Active | Multi-category parsing with location radius filters |
| **Zome Real Estate** (`zome.pt`) | ✅ Active | SPA hydration & structured preview item extraction |
| **Decisões e Soluções** (`decisoesesolucoes.com`) | ✅ Active | Dynamic listing parser with financial filtering |
| **Francisco Faria** (`franciscofaria.pt`) | ✅ Active | Local Barcelos real estate adapter |
| **Lar de Sonho** (`lardesonho.pt`) | ✅ Active | Multi-type housing search parser |
| **Factor Valor** (`factorvalor.pt`) | ✅ Active | Property wrap extraction & price sanitization |
| **H-Urb** (`h-urb.com`) | ✅ Active | Local catalog extraction |
| **Barcelcasa** (`barcelcasa.pt`) | ✅ Active | Local agency adapter |
| **H-Aconchego** (`haconchego.pt`) | ✅ Active | Property item structure parser |
| **Casa Sapo / SuperCasa** (`casa.sapo.pt`) | ✅ Active | Aggregator parsing support |
| **Idealista** (`idealista.pt`) | ⚠️ Captcha-aware | Bot challenge detection & graceful error reporting |
| **Generic Heuristic Parser** | 🌐 Universal | Heuristic fallback for any unlisted real estate site |

---

## ⚙️ Configuration (`.env`)

Create a `.env` file in the root directory:

```ini
# Database Connection (PostgreSQL)
DATABASE_URL=postgresql://user:pass@imobot_db:5432/imoveis

# Telegram Notification Settings
TELEGRAM_TOKEN=123456789:ABCdefGhIJKlmNoPQRsTUVwxyZ
CHAT_ID=-1001234567890

# Scraper Settings
SCRAPE_INTERVAL=1800           # Run cycle every 30 minutes (in seconds)
CONCURRENCY_LIMIT=2            # Max concurrent browser pages
MIN_PRICE=100000               # Filter out listings below this price (€)

# Browser Endpoint (Docker/Remote Browserless)
BROWSER_WS_ENDPOINT=ws://imobot_browser:3000/chromium/playwright
```

---

## 🚀 Deployment & Running

### Option 1: Production Server (Portainer / Docker Compose)

The repository includes a production-tuned configuration (`docker-compose.server.yml`) with pre-configured network isolation and custom ports (Dashboard on `:8085` to prevent conflicts):

```bash
# 1. Clone repository & configure .env and links
git clone https://github.com/pedroboas/imobot.git
cd imobot
cp .env.example .env

# 2. Build and launch all services in detached mode
sudo docker compose -f docker-compose.server.yml up -d --build

# 3. View live scraper logs
sudo docker compose -f docker-compose.server.yml logs -f scraper
```

### Option 2: Local Development

```bash
# 1. Install Python dependencies
pip install -r requirements.txt
playwright install chromium

# 2. Start local Docker dependencies (DB + Browserless)
docker compose up -d db browser

# 3. Run scraper directly
python scraper.py

# 4. Start dashboard in another terminal
python dashboard/app.py
```

---

## 📱 Telegram Alert Format

When a new listing is found, a formatted alert is sent instantly to your Telegram chat:

```text
🔔 NOVA DESCOBERTA!
⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
🏠 Apartamento T2 Novo em Galegos (Santa Maria)
🛏️ Tipologia: T2
💰 Preço: 259.000 €
🌐 Portal: Grupomerito
⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
🔗 Ver Anúncio Original
```

---

## 📊 Web Dashboard

Access the web dashboard at `http://<SERVER_IP>:8085` or via your reverse proxy (e.g. Nginx Proxy Manager):

* **Real-Time Logs**: View log output stream via WebSockets without SSH access.
* **Manual Scrape**: Trigger an immediate scrape cycle using the UI button.
* **Property Search**: Filter and search through all historical scraped listings.
* **Cycle Telemetry**: Monitor average scrape duration, error/block rates, and portal performance.

---

## 🛠️ Adding New Portals

Adding support for a new agency or portal is straightforward:

1. Create a parser in `adapters/myportal.py`:
   ```python
   def parse_myportal(html_content):
       # Extract properties returning a list of dicts:
       # [{'id': '123', 'title': '...', 'price': '250.000 €', 'url': '...', 'site': 'myportal'}]
       return properties
   ```
2. Register the parser in `scraper.py` inside `PARSERS` and `SITE_WAIT_SELECTORS`.
3. Add your target search URL to the `links` file.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
