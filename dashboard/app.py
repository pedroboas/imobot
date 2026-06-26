import os
import asyncio
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Request
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from sqlalchemy import create_engine, desc
from sqlalchemy.orm import sessionmaker
from database import Base, Property, ScrapeLog, RunSummary, get_session
import json
import secrets
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBasic, HTTPBasicCredentials

app = FastAPI()

# Setup paths
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
templates = Jinja2Templates(directory=os.path.join(BASE_DIR, "templates"))
app.mount("/static", StaticFiles(directory=os.path.join(BASE_DIR, "static")), name="static")

LOG_FILE = "/app/scraper.log"

@app.get("/")
async def get_dashboard(request: Request):
    return templates.TemplateResponse(request=request, name="index.html")

@app.get("/api/stats")
async def get_stats():
    with get_session() as session:
        total = session.query(Property).count()
        by_site = {}
        sites = session.query(Property.site).distinct().all()
        for (site,) in sites:
            by_site[site] = session.query(Property).filter(Property.site == site).count()
        
        return {
            "total_properties": total,
            "by_site": by_site,
            "status": "Online" # In a real scenario, we could check if scraper process is alive
        }

@app.get("/api/properties")
async def get_recent_properties():
    with get_session() as session:
        props = session.query(Property).order_by(desc(Property.found_at)).limit(10).all()
        return [
            {
                "id": p.id,
                "site": p.site,
                "title": p.title,
                "url": p.url,
                "price": p.price,
                "found_at": p.found_at.isoformat()
            } for p in props
        ]

@app.get("/api/health")
async def get_health():
    with get_session() as session:
        # Get the latest run
        latest_run = session.query(RunSummary).order_by(desc(RunSummary.created_at)).first()
        if not latest_run:
            return {"latest_run": None, "site_health": []}
        
        # Get site health for the latest run
        site_logs = session.query(ScrapeLog).filter(ScrapeLog.run_id == latest_run.run_id).all()
        
        site_health = []
        for log in site_logs:
            site_health.append({
                "site": log.site,
                "status": log.status,
                "found": log.found_count,
                "valid": log.valid_count,
                "new": log.new_count,
                "error": log.error_message,
                "duration": log.duration_seconds
            })
            
        return {
            "latest_run": {
                "id": latest_run.run_id,
                "created_at": latest_run.created_at.isoformat(),
                "duration": latest_run.duration_seconds,
                "success": latest_run.success_count,
                "error": latest_run.error_count,
                "blocked": latest_run.blocked_count,
                "total_found": latest_run.total_found
            },
            "site_health": site_health
        }

@app.websocket("/ws/logs")
async def websocket_logs(websocket: WebSocket):
    await websocket.accept()
    try:
        # Initial tail of the last few lines
        if os.path.exists(LOG_FILE):
            with open(LOG_FILE, "r") as f:
                lines = f.readlines()[-50:]
                for line in lines:
                    await websocket.send_text(line.strip())
        
        # Stream new lines
        while True:
            if os.path.exists(LOG_FILE):
                with open(LOG_FILE, "r") as f:
                    f.seek(0, os.SEEK_END)
                    while True:
                        line = f.readline()
                        if not line:
                            await asyncio.sleep(1)
                            continue
                        await websocket.send_text(line.strip())
            else:
                await asyncio.sleep(2)
    except WebSocketDisconnect:
        pass

@app.post("/api/trigger")
async def trigger_scan():
    # In this Docker setup, a simple way to trigger is to create a signal file
    # that the scraper.py checks periodically or use a more advanced IPC.
    # For now, we'll create a 'trigger.flag' file.
    with open("/app/trigger.flag", "w") as f:
        f.write("1")
    return {"message": "Scan triggered"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)
