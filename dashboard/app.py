import os
import asyncio
import json
import secrets
from datetime import datetime, timezone
from typing import Optional, List
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Request, Response, Depends, HTTPException, status, Query
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from fastapi.responses import JSONResponse
from sqlalchemy import create_engine, desc, asc, func, or_
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


def infer_property_type(title: Optional[str], url: Optional[str]) -> str:
    text = f"{title or ''} {url or ''}".lower()
    if any(k in text for k in ["terreno", "lote", "quintinha", "quinta", "rústico", "rustico"]):
        return "terreno"
    if any(k in text for k in ["moradia", "vivenda", "andar de moradia", "casa rústica", "casa para recuperar", "moradias"]):
        return "moradia"
    if any(k in text for k in ["apartamento", "apartamentos", "andar", "duplex", "penthouse", "estúdio", "estudio", "t0", "t1", "t2", "t3", "t4"]):
        return "apartamento"
    return "outro"


def compute_percentile(sorted_vals: List[float], pct: float) -> float:
    if not sorted_vals:
        return 0
    n = len(sorted_vals)
    if n == 1:
        return sorted_vals[0]
    pos = (pct / 100.0) * (n - 1)
    lower = int(pos)
    upper = min(lower + 1, n - 1)
    weight = pos - lower
    return sorted_vals[lower] * (1 - weight) + sorted_vals[upper] * weight


def format_relative_age(dt: Optional[datetime]) -> str:
    if not dt:
        return "recente"
    now = datetime.utcnow()
    diff = now - dt.replace(tzinfo=None)
    hours = int(diff.total_seconds() // 3600)
    if hours < 1:
        mins = max(1, int(diff.total_seconds() // 60))
        return f"há {mins} min"
    if hours < 24:
        return f"há {hours} h"
    days = diff.days
    if days == 1:
        return "há 1 dia"
    return f"há {days} dias"


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
    return templates.TemplateResponse(
        request=request,
        name="index.html",
        headers={"Cache-Control": "no-cache, no-store, must-revalidate"}
    )


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
            max_age=86400 * 7  # 7 days
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
        sites = session.query(Property.site, func.count(Property.id)).group_by(Property.site).order_by(desc(func.count(Property.id))).all()
        for site, cnt in sites:
            by_site[site] = cnt
        
        return {
            "total_properties": total,
            "by_site": by_site,
            "status": "Online"
        }


@app.get("/api/filters")
async def get_filters():
    """
    Returns dynamic filter lists with counts (portals, typologies, parishes, property types).
    """
    with get_session() as session:
        site_rows = session.query(
            Property.site, func.count(Property.id).label("cnt")
        ).filter(Property.is_active == True).group_by(Property.site).order_by(desc("cnt")).all()

        typo_rows = session.query(
            Property.typology, func.count(Property.id).label("cnt")
        ).filter(Property.is_active == True, Property.typology.isnot(None)).group_by(Property.typology).order_by(Property.typology).all()

        parish_rows = session.query(
            Property.parish, func.count(Property.id).label("cnt")
        ).filter(Property.is_active == True, Property.parish.isnot(None)).group_by(Property.parish).order_by(desc("cnt")).all()

        all_props = session.query(Property.title, Property.url).filter(Property.is_active == True).all()
        type_counts = {"apartamento": 0, "moradia": 0, "terreno": 0}
        for t, u in all_props:
            pt = infer_property_type(t, u)
            if pt in type_counts:
                type_counts[pt] += 1

        return {
            "sites": [{"site": s, "count": c} for s, c in site_rows if s],
            "typologies": [{"typology": t, "count": c} for t, c in typo_rows if t],
            "parishes": [{"parish": p, "count": c} for p, c in parish_rows if p],
            "types": [
                {"type": "apartamento", "label": "Apartamentos", "count": type_counts["apartamento"]},
                {"type": "moradia", "label": "Moradias", "count": type_counts["moradia"]},
                {"type": "terreno", "label": "Terrenos / Quintas", "count": type_counts["terreno"]},
            ]
        }


@app.get("/api/properties")
async def get_properties(
    q: Optional[str] = None,
    site: Optional[str] = None,
    property_type: Optional[str] = None,
    typology: Optional[str] = None,
    parish: Optional[str] = None,
    min_price: Optional[int] = None,
    max_price: Optional[int] = None,
    status_filter: str = "active",
    sort: str = "newest",
    offset: int = Query(default=0, ge=0),
    limit: int = Query(default=36, le=200)
):
    """
    Search and filter properties with sorting and pagination.
    """
    with get_session() as session:
        query = session.query(Property)

        if status_filter == "active":
            query = query.filter(Property.is_active == True)
        elif status_filter == "removed":
            query = query.filter(Property.is_active == False)

        if q:
            term = f"%{q.strip()}%"
            query = query.filter(
                or_(
                    Property.title.ilike(term),
                    Property.parish.ilike(term),
                    Property.site.ilike(term),
                    Property.id.ilike(term)
                )
            )

        if site and site not in ("Todos", ""):
            query = query.filter(Property.site == site)

        if property_type and property_type not in ("Todos", ""):
            pt = property_type.lower()
            if pt == "moradia":
                query = query.filter(or_(
                    Property.title.ilike("%moradia%"),
                    Property.title.ilike("%vivenda%"),
                    Property.url.ilike("%moradia%")
                ))
            elif pt == "apartamento":
                query = query.filter(or_(
                    Property.title.ilike("%apartamento%"),
                    Property.title.ilike("%andar%"),
                    Property.title.ilike("%duplex%"),
                    Property.url.ilike("%apartamento%")
                ))
            elif pt == "terreno":
                query = query.filter(or_(
                    Property.title.ilike("%terreno%"),
                    Property.title.ilike("%lote%"),
                    Property.title.ilike("%quinta%"),
                    Property.url.ilike("%terreno%")
                ))

        if typology and typology not in ("Todos", ""):
            query = query.filter(Property.typology == typology)

        if parish and parish not in ("Todas", ""):
            query = query.filter(Property.parish == parish)

        if min_price is not None and min_price > 0:
            query = query.filter(Property.numeric_price >= min_price)

        if max_price is not None and max_price > 0:
            query = query.filter(Property.numeric_price <= max_price)

        total_matching = query.count()

        # Sorting
        if sort == "price_asc":
            query = query.filter(Property.numeric_price > 0).order_by(asc(Property.numeric_price))
        elif sort == "price_desc":
            query = query.filter(Property.numeric_price > 0).order_by(desc(Property.numeric_price))
        elif sort == "score_desc":
            query = query.order_by(desc(Property.opportunity_score), desc(Property.found_at))
        elif sort == "oldest":
            query = query.order_by(asc(Property.found_at))
        else:  # newest
            query = query.order_by(desc(Property.found_at))

        props = query.offset(offset).limit(limit).all()
        now = datetime.utcnow()

        items = []
        for p in props:
            is_new = False
            if p.found_at:
                diff_hours = (now - p.found_at.replace(tzinfo=None)).total_seconds() / 3600.0
                is_new = diff_hours <= 24

            items.append({
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
                "is_active": p.is_active,
                "is_new": is_new,
                "property_type": infer_property_type(p.title, p.url),
                "age_label": format_relative_age(p.found_at),
                "found_at": p.found_at.isoformat() if p.found_at else None
            })

        return {
            "total": total_matching,
            "offset": offset,
            "limit": limit,
            "items": items
        }


@app.get("/api/property/{prop_id:path}")
async def get_property_detail(prop_id: str):
    """
    Returns full property details, price history, cross-portal matches,
    and market positioning distribution (p10, p25, median, p75, p90) like imo.residvia.com.
    """
    with get_session() as session:
        prop = session.query(Property).filter(Property.id == prop_id).first()
        if not prop:
            raise HTTPException(status_code=404, detail="Imóvel não encontrado")

        ptype = infer_property_type(prop.title, prop.url)
        typo = prop.typology or "T2"

        # Comparable sample: active sale properties with same typology and valid price
        comp_query = session.query(Property).filter(
            Property.is_active == True,
            Property.numeric_price > 1000,
            Property.typology == typo
        ).all()

        comp_prices = sorted([c.numeric_price for c in comp_query if c.numeric_price and c.numeric_price > 1000])
        comp_m2 = sorted([c.price_per_m2 for c in comp_query if c.price_per_m2 and c.price_per_m2 > 100])
        comp_areas = sorted([c.area_m2 for c in comp_query if c.area_m2 and c.area_m2 > 10])

        def build_distribution(vals: List[float], target_val: Optional[float]):
            if not vals or len(vals) < 3:
                return None
            p10 = int(round(compute_percentile(vals, 10)))
            p25 = int(round(compute_percentile(vals, 25)))
            med = int(round(compute_percentile(vals, 50)))
            p75 = int(round(compute_percentile(vals, 75)))
            p90 = int(round(compute_percentile(vals, 90)))
            min_v = int(round(vals[0]))
            max_v = int(round(vals[-1]))

            # Scale positions between p10..p90 with padding
            span_min = max(1, int(p10 * 0.85))
            span_max = max(span_min + 1, int(p90 * 1.15))

            def norm_x(v):
                clamped = max(span_min, min(span_max, v))
                return round(12 + ((clamped - span_min) / (span_max - span_min)) * 296, 1)

            # Sample up to 60 points for dot plot
            step = max(1, len(vals) // 60)
            sampled_dots = [norm_x(vals[i]) for i in range(0, len(vals), step)]

            target_info = None
            if target_val and target_val > 0:
                diff = int(round(target_val - med))
                diff_pct = round(((target_val - med) / med) * 100, 1) if med else 0
                cheaper_count = sum(1 for v in vals if v < target_val)
                pct_rank = int(round((cheaper_count / len(vals)) * 100))
                if diff_pct <= -12:
                    label = "bem abaixo do mercado"
                    tone = "success"
                elif diff_pct <= -3:
                    label = "abaixo do mercado"
                    tone = "success"
                elif diff_pct <= 5:
                    label = "dentro da mediana"
                    tone = "neutral"
                else:
                    label = "acima da mediana"
                    tone = "warning"

                target_info = {
                    "value": int(round(target_val)),
                    "x": norm_x(target_val),
                    "diff": diff,
                    "diff_pct": diff_pct,
                    "percentile_rank": pct_rank,
                    "label": label,
                    "tone": tone
                }

            return {
                "count": len(vals),
                "min": min_v,
                "p10": p10,
                "p25": p25,
                "median": med,
                "p75": p75,
                "p90": p90,
                "max": max_v,
                "x_p10": norm_x(p10),
                "x_p25": norm_x(p25),
                "x_median": norm_x(med),
                "x_p75": norm_x(p75),
                "x_p90": norm_x(p90),
                "dots": sampled_dots,
                "target": target_info
            }

        price_dist = build_distribution(comp_prices, prop.numeric_price)
        m2_dist = build_distribution(comp_m2, prop.price_per_m2)
        median_area = int(round(compute_percentile(comp_areas, 50))) if comp_areas else None

        # Price history for this property
        history_rows = session.query(PriceHistory).filter(
            PriceHistory.property_id == prop.id
        ).order_by(asc(PriceHistory.detected_at)).all()

        history = [
            {
                "old_price": h.old_price,
                "new_price": h.new_price,
                "change_amount": h.change_amount,
                "change_pct": h.change_pct,
                "detected_at": h.detected_at.strftime("%d/%m/%Y %H:%M") if h.detected_at else ""
            }
            for h in history_rows
        ]

        # Potential cross-portal matches (same typology & parish, price within ±3%)
        similar_rows = []
        if prop.numeric_price and prop.numeric_price > 1000:
            low_p = int(prop.numeric_price * 0.97)
            high_p = int(prop.numeric_price * 1.03)
            candidates = session.query(Property).filter(
                Property.id != prop.id,
                Property.typology == prop.typology,
                Property.parish == prop.parish,
                Property.numeric_price.between(low_p, high_p)
            ).limit(6).all()
            for c in candidates:
                similar_rows.append({
                    "id": c.id,
                    "site": c.site,
                    "title": c.title,
                    "price": c.price,
                    "area_m2": c.area_m2,
                    "url": c.url,
                    "found_at": c.found_at.strftime("%d/%m/%Y") if c.found_at else ""
                })

        return {
            "id": prop.id,
            "site": prop.site,
            "title": prop.title,
            "url": prop.url,
            "price": prop.price,
            "numeric_price": prop.numeric_price,
            "typology": typo,
            "parish": prop.parish or "Barcelos",
            "property_type": ptype,
            "area_m2": prop.area_m2,
            "price_per_m2": int(round(prop.price_per_m2)) if prop.price_per_m2 else None,
            "condition": prop.condition or "Usado",
            "has_garage": bool(prop.has_garage),
            "has_elevator": bool(prop.has_elevator),
            "opportunity_score": prop.opportunity_score or 50,
            "image_url": prop.image_url,
            "is_active": prop.is_active,
            "found_at_str": prop.found_at.strftime("%d/%m/%Y às %H:%M") if prop.found_at else "N/A",
            "found_age": format_relative_age(prop.found_at),
            "last_seen_age": format_relative_age(getattr(prop, "last_seen_at", None)),
            "comparables": {
                "typology": typo,
                "sample_count": len(comp_prices),
                "median_area": median_area,
                "price_distribution": price_dist,
                "m2_distribution": m2_dist
            },
            "price_history": history,
            "similar_listings": similar_rows
        }


@app.get("/api/analytics/overview")
async def get_analytics_overview():
    with get_session() as session:
        total = session.query(Property).count()
        
        avg_price = session.query(func.avg(Property.numeric_price)).filter(
            Property.numeric_price > 1000
        ).scalar() or 0
        
        avg_m2 = session.query(func.avg(Property.price_per_m2)).filter(
            Property.price_per_m2 > 100
        ).scalar() or 0
        
        total_drops = session.query(PriceHistory).filter(PriceHistory.change_amount < 0).count()
        total_deals = session.query(Property).filter(Property.opportunity_score >= 78).count()
        
        prices = [r[0] for r in session.query(Property.numeric_price).filter(Property.numeric_price > 1000).order_by(Property.numeric_price).all()]
        median_price = int(round(compute_percentile(prices, 50))) if prices else 0

        return {
            "total_properties": total,
            "avg_price": int(round(avg_price)),
            "median_price": median_price,
            "avg_price_per_m2": int(round(avg_m2)),
            "total_price_drops": total_drops,
            "total_deals": total_deals
        }


@app.get("/api/analytics/full")
async def get_analytics_full():
    """
    Complete statistical indicators inspired by imo.residvia.com/indicadores:
    - Sample breakdown ("O que entra nas contas")
    - Sale medians & IQRs
    - By Typology table with bars
    - By Property Type (Apartamento / Moradia / Terreno)
    - By Portal table with bars
    - Full By Parish table with bars
    - Stock by Price Brackets ("Onde está o stock")
    - Stock by Age ("Há quanto tempo estão à espera")
    """
    with get_session() as session:
        all_active = session.query(Property).filter(Property.is_active == True).all()
        total_active = len(all_active)

        sale_props = [p for p in all_active if p.numeric_price and p.numeric_price > 2500]
        rent_or_low = [p for p in all_active if p.numeric_price and 0 < p.numeric_price <= 2500]
        no_price = [p for p in all_active if not p.numeric_price or p.numeric_price <= 0]
        with_area = [p for p in sale_props if p.area_m2 and p.area_m2 >= 15 and p.price_per_m2 and p.price_per_m2 > 100]
        no_area = [p for p in sale_props if not p.area_m2 or p.area_m2 < 15]

        all_prices = sorted([p.numeric_price for p in sale_props])
        all_m2 = sorted([p.price_per_m2 for p in with_area])
        all_areas = sorted([p.area_m2 for p in with_area])

        median_price = int(round(compute_percentile(all_prices, 50))) if all_prices else 0
        p25_price = int(round(compute_percentile(all_prices, 25))) if all_prices else 0
        p75_price = int(round(compute_percentile(all_prices, 75))) if all_prices else 0
        avg_price = int(round(sum(all_prices) / len(all_prices))) if all_prices else 0

        median_m2 = int(round(compute_percentile(all_m2, 50))) if all_m2 else 0
        avg_m2 = int(round(sum(all_m2) / len(all_m2))) if all_m2 else 0
        median_area = int(round(compute_percentile(all_areas, 50))) if all_areas else 0

        total_drops = session.query(PriceHistory).filter(PriceHistory.change_amount < 0).count()
        total_deals = sum(1 for p in sale_props if (p.opportunity_score or 0) >= 78)

        # 1. By Typology
        typo_groups = {}
        for p in sale_props:
            t = p.typology or "N/D"
            typo_groups.setdefault(t, []).append(p)

        by_typology = []
        max_typo_price = 1
        for t in ["T0", "T1", "T2", "T3", "T4", "T5"]:
            plist = typo_groups.get(t, [])
            if not plist:
                continue
            p_vals = sorted([x.numeric_price for x in plist])
            m2_vals = sorted([x.price_per_m2 for x in plist if x.price_per_m2 and x.price_per_m2 > 100])
            med_p = int(round(compute_percentile(p_vals, 50)))
            avg_p = int(round(sum(p_vals) / len(p_vals)))
            med_m2_v = int(round(compute_percentile(m2_vals, 50))) if m2_vals else None
            max_typo_price = max(max_typo_price, med_p)
            by_typology.append({
                "typology": t,
                "count": len(plist),
                "median_price": med_p,
                "avg_price": avg_p,
                "min_price": p_vals[0],
                "max_price": p_vals[-1],
                "median_m2": med_m2_v,
                "is_robust": len(plist) >= 20
            })
        for row in by_typology:
            row["bar_pct"] = int(round((row["median_price"] / max_typo_price) * 100))

        # 2. By Property Type (Apartamento / Moradia / Terreno)
        type_groups = {"Apartamento": [], "Moradia": [], "Terreno / Quinta": []}
        for p in sale_props:
            pt = infer_property_type(p.title, p.url)
            if pt == "apartamento":
                type_groups["Apartamento"].append(p)
            elif pt == "moradia":
                type_groups["Moradia"].append(p)
            elif pt == "terreno":
                type_groups["Terreno / Quinta"].append(p)

        by_type = []
        max_type_count = max([len(v) for v in type_groups.values()] + [1])
        for label, plist in type_groups.items():
            if not plist:
                continue
            p_vals = sorted([x.numeric_price for x in plist])
            m2_vals = sorted([x.price_per_m2 for x in plist if x.price_per_m2 and x.price_per_m2 > 100])
            by_type.append({
                "type": label,
                "count": len(plist),
                "median_price": int(round(compute_percentile(p_vals, 50))),
                "avg_price": int(round(sum(p_vals) / len(p_vals))),
                "median_m2": int(round(compute_percentile(m2_vals, 50))) if m2_vals else None,
                "bar_pct": int(round((len(plist) / max_type_count) * 100))
            })

        # 3. By Portal (Site)
        site_groups = {}
        for p in all_active:
            site_groups.setdefault(p.site or "outro", []).append(p)

        by_site = []
        max_site_count = max([len(v) for v in site_groups.values()] + [1])
        for s, plist in sorted(site_groups.items(), key=lambda x: len(x[1]), reverse=True):
            p_vals = sorted([x.numeric_price for x in plist if x.numeric_price and x.numeric_price > 2500])
            by_site.append({
                "site": s,
                "count": len(plist),
                "with_price": len(p_vals),
                "share_pct": round((len(plist) / max(1, total_active)) * 100, 1),
                "median_price": int(round(compute_percentile(p_vals, 50))) if p_vals else 0,
                "avg_price": int(round(sum(p_vals) / len(p_vals))) if p_vals else 0,
                "bar_pct": int(round((len(plist) / max_site_count) * 100))
            })

        # 4. By Parish (All parishes)
        parish_groups = {}
        for p in sale_props:
            par = p.parish or "Barcelos"
            parish_groups.setdefault(par, []).append(p)

        by_parish = []
        for par, plist in parish_groups.items():
            p_vals = sorted([x.numeric_price for x in plist])
            m2_vals = sorted([x.price_per_m2 for x in plist if x.price_per_m2 and x.price_per_m2 > 100])
            by_parish.append({
                "parish": par,
                "count": len(plist),
                "median_price": int(round(compute_percentile(p_vals, 50))),
                "avg_price": int(round(sum(p_vals) / len(p_vals))),
                "min_price": p_vals[0],
                "max_price": p_vals[-1],
                "median_m2": int(round(compute_percentile(m2_vals, 50))) if m2_vals else None,
                "is_robust": len(plist) >= 15
            })
        by_parish.sort(key=lambda x: (x["is_robust"], x["count"]), reverse=True)
        max_parish_price = max([x["median_price"] for x in by_parish] + [1])
        for row in by_parish:
            row["bar_pct"] = int(round((row["median_price"] / max_parish_price) * 100))

        # 5. Price Brackets ("Onde está o stock")
        bracket_defs = [
            ("Menos de 100 mil €", 0, 100000),
            ("100 – 150 mil €", 100000, 150000),
            ("150 – 200 mil €", 150000, 200000),
            ("200 – 250 mil €", 200000, 250000),
            ("250 – 300 mil €", 250000, 300000),
            ("300 – 400 mil €", 300000, 400000),
            ("400 – 500 mil €", 400000, 500000),
            ("500 mil € ou mais", 500000, 999999999),
        ]
        price_brackets = []
        total_sale = max(1, len(sale_props))
        for label, low, high in bracket_defs:
            cnt = sum(1 for v in all_prices if low <= v < high)
            price_brackets.append({
                "label": label,
                "count": cnt,
                "pct": round((cnt / total_sale) * 100, 1)
            })
        max_bracket_cnt = max([b["count"] for b in price_brackets] + [1])
        for b in price_brackets:
            b["bar_pct"] = int(round((b["count"] / max_bracket_cnt) * 100))

        # 6. Age of Listings ("Há quanto tempo estão monitorizados")
        now = datetime.utcnow()
        ages_days = []
        for p in all_active:
            if p.found_at:
                d = max(0, (now - p.found_at.replace(tzinfo=None)).days)
                ages_days.append(d)
        ages_days.sort()
        median_age = int(round(compute_percentile(ages_days, 50))) if ages_days else 0
        p25_age = int(round(compute_percentile(ages_days, 25))) if ages_days else 0
        p75_age = int(round(compute_percentile(ages_days, 75))) if ages_days else 0

        age_defs = [
            ("Menos de 24 horas (Novos hoje)", 0, 1),
            ("1 a 7 dias", 1, 7),
            ("1 a 4 semanas", 7, 30),
            ("1 a 3 meses", 30, 90),
            ("Mais de 3 meses", 90, 99999),
        ]
        age_brackets = []
        total_aged = max(1, len(ages_days))
        for label, low_d, high_d in age_defs:
            cnt = sum(1 for d in ages_days if low_d <= d < high_d)
            age_brackets.append({
                "label": label,
                "count": cnt,
                "pct": round((cnt / total_aged) * 100, 1)
            })
        max_age_cnt = max([b["count"] for b in age_brackets] + [1])
        for b in age_brackets:
            b["bar_pct"] = int(round((b["count"] / max_age_cnt) * 100))

        return {
            "sample": {
                "total_active": total_active,
                "sale_with_price": len(sale_props),
                "with_area": len(with_area),
                "no_price": len(no_price),
                "no_area": len(no_area),
                "rent_or_low": len(rent_or_low),
            },
            "kpis": {
                "median_price": median_price,
                "p25_price": p25_price,
                "p75_price": p75_price,
                "avg_price": avg_price,
                "median_m2": median_m2,
                "avg_m2": avg_m2,
                "n_m2": len(with_area),
                "median_area": median_area,
                "total_price_drops": total_drops,
                "total_deals": total_deals,
                "median_age_days": median_age,
                "p25_age_days": p25_age,
                "p75_age_days": p75_age,
            },
            "by_typology": by_typology,
            "by_type": by_type,
            "by_site": by_site,
            "by_parish": by_parish,
            "price_brackets": price_brackets,
            "age_brackets": age_brackets,
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
            Property.numeric_price > 1000,
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
            Property.numeric_price > 1000,
            Property.parish.isnot(None)
        ).group_by(Property.parish).order_by(desc("count")).limit(15).all()

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
            Property.numeric_price > 1000
        ).order_by(desc(Property.opportunity_score), desc(Property.found_at)).limit(24).all()

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
        ).filter(
            PriceHistory.change_amount < 0
        ).order_by(desc(PriceHistory.detected_at)).limit(25).all()

        return [
            {
                "id": ph.id,
                "property_id": ph.property_id,
                "title": prop.title if prop else "Imóvel",
                "url": prop.url if prop else "#",
                "site": prop.site if prop else "",
                "parish": prop.parish if prop else "Barcelos",
                "typology": prop.typology if prop else "",
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
