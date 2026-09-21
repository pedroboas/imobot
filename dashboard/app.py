import os
import asyncio
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Request
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from sqlalchemy import create_engine, desc, func
from sqlalchemy.orm import sessionmaker
from database import Base, Property, PriceHistory, ScrapeLog, RunSummary, get_session
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
            "status": "Online"
        }

@app.get("/api/properties")
async def get_recent_properties():
    with get_session() as session:
        props = session.query(Property).order_by(desc(Property.found_at)).limit(12).all()
        return [
            {
                "id": p.id,
                "site": p.site,
                "title": p.title,
                "url": p.url,
                "price": p.price,
                "numeric_price": p.numeric_price,
                "typology": p.typology or "T2",
                "parish": p.parish or "Barcelos",
                "area_m2": p.area_m2,
                "price_per_m2": p.price_per_m2,
                "condition": p.condition,
                "has_garage": p.has_garage,
                "has_elevator": p.has_elevator,
                "opportunity_score": p.opportunity_score or 50,
                "image_url": p.image_url,
                "found_at": p.found_at.isoformat() if p.found_at else None
            } for p in props
        ]

@app.get("/api/analytics/overview")
async def get_analytics_overview():
    with get_session() as session:
        total = session.query(Property).count()
        
        avg_price = session.query(func.avg(Property.numeric_price)).filter(
            Property.numeric_price > 0
        ).scalar() or 0
        
        avg_m2 = session.query(func.avg(Property.price_per_m2)).filter(
            Property.price_per_m2 > 0
        ).scalar() or 0
        
        total_drops = session.query(PriceHistory).count()
        total_deals = session.query(Property).filter(Property.opportunity_score >= 78).count()
        
        # Calculate median price using sorted list or percentile
        prices = [r[0] for r in session.query(Property.numeric_price).filter(Property.numeric_price > 0).order_by(Property.numeric_price).all()]
        median_price = prices[len(prices)//2] if prices else 0

        return {
            "total_properties": total,
            "avg_price": int(round(avg_price)),
            "median_price": int(median_price),
            "avg_price_per_m2": int(round(avg_m2)),
            "total_price_drops": total_drops,
            "total_deals": total_deals
        }

@app.get("/api/analytics/by-typology")
async def get_analytics_by_typology():
    with get_session() as session:
        rows = session.query(
            Property.typology,
            func.count(Property.id).label("count"),
            func.avg(Property.numeric_price).label("avg_price"),
            func.min(Property.numeric_price).label("min_price"),
            func.max(Property.numeric_price).label("max_price"),
            func.avg(Property.price_per_m2).label("avg_m2")
        ).filter(
            Property.numeric_price > 0,
            Property.typology.isnot(None)
        ).group_by(Property.typology).order_by(Property.typology).all()

        return [
            {
                "typology": r.typology,
                "count": r.count,
                "avg_price": int(round(r.avg_price)) if r.avg_price else 0,
                "min_price": r.min_price or 0,
                "max_price": r.max_price or 0,
                "avg_price_per_m2": int(round(r.avg_m2)) if r.avg_m2 else None
            } for r in rows if r.typology in ["T1", "T2", "T3", "T4", "T5"]
        ]

@app.get("/api/analytics/by-parish")
async def get_analytics_by_parish():
    with get_session() as session:
        rows = session.query(
            Property.parish,
            func.count(Property.id).label("count"),
            func.avg(Property.numeric_price).label("avg_price"),
            func.avg(Property.price_per_m2).label("avg_m2")
        ).filter(
            Property.numeric_price > 0,
            Property.parish.isnot(None)
        ).group_by(Property.parish).order_by(desc("count")).limit(12).all()

        return [
            {
                "parish": r.parish,
                "count": r.count,
                "avg_price": int(round(r.avg_price)) if r.avg_price else 0,
                "avg_price_per_m2": int(round(r.avg_m2)) if r.avg_m2 else None
            } for r in rows
        ]

@app.get("/api/analytics/deals")
async def get_top_deals():
    with get_session() as session:
        deals = session.query(Property).filter(
            Property.opportunity_score >= 70,
            Property.numeric_price > 0
        ).order_by(desc(Property.opportunity_score), desc(Property.found_at)).limit(10).all()

        return [
            {
                "id": d.id,
                "title": d.title,
                "price": d.price,
                "numeric_price": d.numeric_price,
                "typology": d.typology or "T2",
                "parish": d.parish or "Barcelos",
                "area_m2": d.area_m2,
                "score": d.opportunity_score,
                "site": d.site,
                "url": d.url,
                "image_url": d.image_url
            } for d in deals
        ]

@app.get("/api/analytics/price-drops")
async def get_price_drops():
    with get_session() as session:
        drops = session.query(
            PriceHistory, Property
        ).outerjoin(
            Property, PriceHistory.property_id == Property.id
        ).order_by(desc(PriceHistory.detected_at)).limit(10).all()

        return [
            {
                "id": ph.id,
                "property_id": ph.property_id,
                "title": prop.title if prop else "Imóvel",
                "url": prop.url if prop else "#",
                "site": prop.site if prop else "",
                "old_price": ph.old_price,
                "new_price": ph.new_price,
                "change_amount": ph.change_amount,
                "change_pct": ph.change_pct,
                "detected_at": ph.detected_at.isoformat() if ph.detected_at else None
            } for ph, prop in drops
        ]

@app.get("/api/health")
async def get_health():
    with get_session() as session:
        latest_run = session.query(RunSummary).order_by(desc(RunSummary.created_at)).first()
        if not latest_run:
            return {"latest_run": None, "site_health": []}
        
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
        if os.path.exists(LOG_FILE):
            with open(LOG_FILE, "r") as f:
                lines = f.readlines()[-50:]
                for line in lines:
                    await websocket.send_text(line.strip())
        
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
    with open("/app/trigger.flag", "w") as f:
        f.write("1")
    return {"message": "Scan triggered"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)
