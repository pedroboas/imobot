import os
import asyncio
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Request
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from sqlalchemy import create_engine, desc
from sqlalchemy.orm import sessionmaker
from database import Base, Property, get_session
import json
import secrets
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBasic, HTTPBasicCredentials

app = FastAPI()
security = HTTPBasic()

def get_current_username(credentials: HTTPBasicCredentials = Depends(security)):
    correct_username = os.getenv("DASHBOARD_USER", "admin") 
    correct_password = secrets.compare_digest(credentials.password, os.getenv("DASHBOARD_PASSWORD", "admin"))
    
    if not (secrets.compare_digest(credentials.username, correct_username) and correct_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password",
            headers={"WWW-Authenticate": "Basic"},
        )
    return credentials.username

# Setup paths
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
templates = Jinja2Templates(directory=os.path.join(BASE_DIR, "templates"))
app.mount("/static", StaticFiles(directory=os.path.join(BASE_DIR, "static")), name="static")

LOG_FILE = "/app/scraper.log"

@app.get("/", dependencies=[Depends(get_current_username)])
async def get_dashboard(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

@app.get("/api/stats", dependencies=[Depends(get_current_username)])
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

@app.get("/api/properties", dependencies=[Depends(get_current_username)])
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

@app.post("/api/trigger", dependencies=[Depends(get_current_username)])
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
