"""
Market Intelligence & Opportunity Valuation Engine
---------------------------------------------------
Calculates baseline statistical models per parish/typology in Barcelos,
computes Opportunity Scores (0-100), and flags high-potential deals (Bargains).
"""

from sqlalchemy import func
from database import Property, get_session

# Heuristic market fallbacks for Barcelos (used when sample size in DB is low)
DEFAULT_BARCELOS_BENCHMARKS = {
    "T1": {"avg_price": 145000, "avg_m2": 65, "eur_m2": 2230},
    "T2": {"avg_price": 215000, "avg_m2": 95, "eur_m2": 2260},
    "T3": {"avg_price": 260000, "avg_m2": 135, "eur_m2": 1925},
    "T4": {"avg_price": 310000, "avg_m2": 190, "eur_m2": 1630},
    "T5": {"avg_price": 360000, "avg_m2": 240, "eur_m2": 1500},
}

PARISH_PRICE_INDEX = {
    # Premium / Center Zones (+10% to +15%)
    "Barcelos Centro": 1.15,
    "Barcelos (Geral)": 1.05,
    "Arcozelo": 1.10,
    "Barcelinhos": 1.10,
    "Vila Frescaínha": 1.05,
    # Residential Suburban (Base 1.00)
    "Galegos": 1.00,
    "Silva": 1.00,
    "Alvelos": 0.98,
    "Manhente": 0.98,
    "Lijó": 0.98,
    "Rio Covo": 0.96,
    "Tamel": 0.96,
    "Abade de Neiva": 1.02,
    "Viatodos": 0.95,
    "Martim": 0.94,
    "Gilmonde": 0.94,
    "Carapeços": 0.92,
    "Pousa": 0.92,
    "Areias": 0.90,
}


def get_market_benchmarks():
    """
    Computes real-time average prices per (parish, typology) from the database,
    blended with baseline benchmarks for statistical stability.
    """
    benchmarks = {}
    try:
        with get_session() as session:
            rows = session.query(
                Property.parish,
                Property.typology,
                func.avg(Property.numeric_price).label("avg_price"),
                func.count(Property.id).label("count"),
                func.avg(Property.price_per_m2).label("avg_m2")
            ).filter(
                Property.numeric_price.isnot(None),
                Property.numeric_price > 0,
                Property.is_active == True
            ).group_by(Property.parish, Property.typology).all()

            for r in rows:
                if r.parish and r.typology:
                    benchmarks[(r.parish, r.typology)] = {
                        "avg_price": float(r.avg_price),
                        "count": int(r.count),
                        "avg_m2_price": float(r.avg_m2) if r.avg_m2 else None
                    }
    except Exception:
        pass
        
    return benchmarks


def evaluate_property_opportunity(prop_dict, benchmarks=None):
    """
    Evaluates a property against the market and computes its Opportunity Score (1-99).
    Returns detailed valuation metadata.
    """
    num_price = prop_dict.get("numeric_price")
    typology = prop_dict.get("typology") or "T2"
    parish = prop_dict.get("parish") or "Barcelos (Geral)"
    condition = prop_dict.get("condition") or "Usado"
    has_garage = prop_dict.get("has_garage", False)
    area = prop_dict.get("area_m2")
    price_m2 = prop_dict.get("price_per_m2")

    if not num_price or num_price <= 0:
        return {
            "score": 50,
            "is_bargain": False,
            "estimated_market_value": None,
            "diff_pct": 0,
            "savings_eur": 0
        }

    # 1. Determine baseline benchmark for this typology
    typo_base = DEFAULT_BARCELOS_BENCHMARKS.get(typology, DEFAULT_BARCELOS_BENCHMARKS["T2"])
    base_price = typo_base["avg_price"]
    
    # Apply parish index multiplier
    parish_multiplier = PARISH_PRICE_INDEX.get(parish, 1.0)
    estimated_market_value = int(base_price * parish_multiplier)

    # Condition adjustments
    if condition == "Novo":
        estimated_market_value = int(estimated_market_value * 1.15)
    elif condition == "Restauro":
        estimated_market_value = int(estimated_market_value * 0.70)

    # If we have real database benchmarks with at least 3 samples, blend it (50/50)
    if benchmarks and (parish, typology) in benchmarks:
        db_stat = benchmarks[(parish, typology)]
        if db_stat["count"] >= 3:
            estimated_market_value = int((estimated_market_value + db_stat["avg_price"]) / 2)

    # 2. Compute price difference
    diff_eur = estimated_market_value - num_price
    diff_pct = round(((num_price - estimated_market_value) / estimated_market_value) * 100, 1)

    # 3. Calculate Opportunity Score (1 to 99)
    # Starts at neutral 50
    score = 50

    # Impact of price vs estimated market value (-30% = +40pts, +30% = -40pts)
    # diff_pct is negative when property is CHEAPER than market value
    score -= int(diff_pct * 1.3)

    # Bonus for Garage in apartments
    if has_garage:
        score += 4

    # Bonus for price per m² below 1700 €/m²
    if price_m2:
        if price_m2 < 1600:
            score += 8
        elif price_m2 > 2400:
            score -= 6

    # Clamp score between 5 and 98
    score = max(5, min(98, score))

    # A property is a "Bargain" (Deal) if:
    # 1. Score is >= 78, OR
    # 2. Price is at least 15% below estimated market value (diff_pct <= -15.0)
    is_bargain = (score >= 78) or (diff_pct <= -15.0)

    return {
        "score": score,
        "is_bargain": is_bargain,
        "estimated_market_value": estimated_market_value,
        "diff_pct": diff_pct,
        "savings_eur": max(0, diff_eur)
    }
