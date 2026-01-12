# Real Estate Scraper Engine

An advanced, asynchronous web scraping solution designed to monitor major Portuguese real estate portals. The system leverages Playwright for browser automation, SQLAlchemy for local persistence, and provides real-time notifications via Telegram.

## Core Features

*   **Asynchronous Processing**: High-performance scraping of multiple domains simultaneously using Python's `asyncio` and `playwright.async_api`.
*   **Anti-Detection Measures**: Implements sophisticated browser headers, randomized staggered starts, and localized viewport/locale settings to bypass bot detection.
*   **Modular Adapter Architecture**: Dedicated parsing logic for portals like Remax, Idealista, Imovirtual, and ERA, with a robust fallback generic parser for unsupported sites.
*   **Automated Persistence**: Full integration with SQLAlchemy to prevent duplicate listings and maintain historical records.
*   **Intelligent Reporting**: Real-time Telegram notifications for new discoveries and detailed end-of-cycle verification reports.
*   **Resiliency**: Automated retry mechanism for transient network failures or interrupted browser connections.

## Architecture Overview

The system is built on a decoupled architecture:

1.  **Orchestrator (`scraper.py`)**: Manages the event loop, handles concurrency limits, and coordinates tasks between parsers and storage.
2.  **Adapter Layer (`adapters/`)**: Site-specific scripts that isolate parsing logic. New portals can be added without modifying the core engine.
3.  **Persistence Layer (`database.py`)**: Manages the life cycle of database sessions and listing verification.
4.  **Browser Layer**: Utilizes Playwright to render dynamic JavaScript-heavy pages, ensuring accessibility to all listing data.

## Configuration

The engine is configured via a `.env` file. Essential parameters include:

| Variable | Description | Default |
| :--- | :--- | :--- |
| `DATABASE_URL` | SQLAlchemy-compatible database connection string | `postgresql://...` |
| `TELEGRAM_TOKEN` | API token for the Telegram notification bot | Required |
| `CHAT_ID` | Telegram chat identifier for alerts | Required |
| `SCRAPE_INTERVAL` | Time in seconds between verification cycles | `3600` |
| `CONCURRENCY_LIMIT` | Maximum number of simultaneous browser tasks | `3` |
| `MIN_PRICE` | Minimum numerical threshold for property filtering | `100000` |

## Deployment and Usage

### Prerequisites

*   Docker and Docker Compose
*   (Optional) Remote browser endpoint (e.g., Browserless)

### Installation

1.  Clone the repository.
2.  Populate the `links` file with the target search URLs (one per line).
3.  Configure the `.env` file with your credentials.

### Execution

Launch the engine using Docker Compose:

```bash
docker-compose up --build -d
```

### Monitoring

To monitor the scraping progress and view the final verification reports in real-time, access the container logs:

```bash
docker-compose logs -f scraper
```

## Site Support and Parsers

The engine included specialized adapters for the following domains:

*   Remax.pt
*   Idealista.pt
*   Imovirtual.com
*   OLX.pt
*   ERA.pt
*   Casa.Sapo.pt
*   Zome.pt
*   CustoJusto.pt

All other domains are processed by the heuristic generic parser, which identifies property-like structures based on common HTML patterns.
