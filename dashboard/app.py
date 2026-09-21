import os
import asyncio
import json
import secrets
from typing import Optional
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Request, Response, Depends, HTTPException, status, Query
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from fastapi.responses import JSONResponse
from sqlalchemy import create_engine, desc, asc, func
from sqlalchemy.orm import sessionmaker
from database import Base, Property, PriceHistory, ScrapeLog, RunSummary, get_session
from analytics.backfill import run_backfill

app = FastAPI(title="ImoBot Real Estate Intelligence")

# Setup paths
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
templates = Jinja2Templates(directory=os.path.join(BASE_DIR, "templates"))
app.mount("/static", StaticFiles(directory=os.path.join(BASE_DIR, "static")), name="static")

LOG_FILE = os.getenv("LOG_FILE", "/app/scraper.log" if os.path.exists("/app") else "scraper.log")
TRIGGER_FILE = os.getenv("TRIGGER_FILE", "/app/trigger.flag" if os.path.exists("/app") else "trigger.flag")

# Authentication credentials
ADMIN_USER = os.getenv("ADMIN_USER", "admin")
ADMIN_PASSWORD = os.getenv("ADMIN_PASSWORD", "admin123")
AUTH_SECRET_TOKEN = os.getenv("SESSION_SECRET", secrets.token_hex(24))

def check_auth(request: Request) -> bool:
    """
    Validates if request is authenticated as Admin via cookie or Authorization header.
    """
    token = request.cookies.get("imobot_session")
    if token and token == AUTH_SECRET_TOKEN:
        return True
        
    auth_header = request.headers.get("Authorization")
    if auth_header and auth_header.startswith("Basic "):
        import base64
        try:
            decoded = base64.b64decode(auth_header[6:]).decode("utf-8")
            u, p = decoded.split(":", 1)
            if u == ADMIN_USER and p == ADMIN_PASSWORD:
                return True
        except Exception:
            pass
    return False

def require_admin(request: Request):
    """
    FastAPI dependency that enforces admin authentication.
    """
    if not check_auth(request):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Autenticação de Administrador necessária para esta operação."
        )
    return True

# --- PUBLIC ENDPOINTS ---

@app.get("/")
async def get_dashboard(request: Request):
    return templates.TemplateResponse(request=request, name="index.html")

@app.get("/api/auth/status")
async def get_auth_status(request: Request):
    is_auth = check_auth(request)
    return {"authenticated": is_auth, "user": ADMIN_USER if is_auth else None}

@app.post("/api/auth/login")
async def login(request: Request, response: Response):
    try:
        body = await request.json()
        username = body.get("username", "").strip()
        password = body.get("password", "").strip()
    except Exception:
        raise HTTPException(status_code=400, detail="Formato JSON inválido")

    if username == ADMIN_USER and password == ADMIN_PASSWORD:
        response.set_cookie(
            key="imobot_session",
            value=AUTH_SECRET_TOKEN,
            httponly=True,
            samesite="lax",
            max_age=86400 * 7 # 7 days
        )
        return {"success": True, "message": "Autenticado com sucesso como Administrador"}
    
    raise HTTPException(status_code=401, detail="Utilizador ou palavra-passe incorretos")

@app.post("/api/auth/logout")
async def logout(response: Response):
    response.delete_cookie(key="imobot_session")
    return {"success": True, "message": "Sessão terminada"}

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
async def get_properties(
    q: Optional[str] = None,
    typology: Optional[str] = None,
    parish: Optional[str] = None,
    min_price: Optional[int] = None,
    max_price: Optional[int] = None,
    sort: str = "newest",
    limit: int = Query(default=30, le=150)
):
    """
    Search and filter properties with sorting and pagination.
    """
    with get_session() as session:
        query = session.query(Property).filter(Property.is_active == True)

        if q:
            term = f"%{q.strip()}%"
            query = query.filter((Property.title.ilike(term)) | (Property.parish.ilike(term)) | (Property.site.ilike(term)))

        if typology and typology != "Todos":
            query = query.filter(Property.typology == typology)

        if parish and parish != "Todas":
            query = query.filter(Property.parish == parish)

        if min_price:
            query = query.filter(Property.numeric_price >= min_price)

        if max_price:
            query = query.filter(Property.numeric_price <= max_price)

        # Sorting
        if sort == "price_asc":
            query = query.order_by(asc(Property.numeric_price))
        elif sort == "price_desc":
            query = query.order_by(desc(Property.numeric_price))
        elif sort == "score_desc":
            query = query.order_by(desc(Property.opportunity_score), desc(Property.found_at))
        else: # newest
            query = query.order_by(desc(Property.found_at))

        props = query.limit(limit).all()

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
        ).order_by(desc(Property.opportunity_score), desc(Property.found_at)).limit(12).all()

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
        ).order_by(desc(PriceHistory.detected_at)).limit(15).all()

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

# --- PROTECTED ADMIN ENDPOINTS ---

@app.get("/api/health")
async def get_health(admin: bool = Depends(require_admin)):
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

@app.post("/api/trigger")
async def trigger_scan(admin: bool = Depends(require_admin)):
    with open(TRIGGER_FILE, "w") as f:
        f.write("1")
    return {"message": "Varrimento manual iniciado pelo Administrador"}

@app.post("/api/admin/backfill")
async def trigger_backfill(admin: bool = Depends(require_admin)):
    asyncio.create_task(asyncio.to_thread(run_backfill))
    return {"message": "Processo de backfill analítico iniciado em segundo plano"}

@app.websocket("/ws/logs")
async def websocket_logs(websocket: WebSocket):
    # Check session cookie from websocket handshake
    cookie_token = websocket.cookies.get("imobot_session")
    query_token = websocket.query_params.get("token")
    
    if cookie_token != AUTH_SECRET_TOKEN and query_token != AUTH_SECRET_TOKEN:
        await websocket.close(code=status.WS_1008_POLICY_VIOLATION)
        return

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

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)
