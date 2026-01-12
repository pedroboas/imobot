FROM python:3.11-slim

# Install system dependencies for Playwright and Psycopg2
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Playwright browsers are handled by the 'browser' service in docker-compose,
# but we might still need the playwright python package to connect to it.
# If running standalone, we would need: RUN playwright install --with-deps chromium

COPY . .

CMD ["python", "scraper.py"]
