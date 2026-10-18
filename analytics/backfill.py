"""
Database Backfill Utility
-------------------------
Enriches existing Property records in the database with structured analytics fields
(typology, parish, numeric_price, area, condition, opportunity_score).
"""

import logging
from database import init_db, get_session, Property
from analytics.extractor import enrich_property
from analytics.engine import evaluate_property_opportunity, get_market_benchmarks

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")
logger = logging.getLogger("backfill")

def run_backfill():
    logger.info("Initializing database migrations...")
    init_db()
    
    with get_session() as session:
        props = session.query(Property).all()
        logger.info(f"Found {len(props)} total properties in database to process.")
        
        enriched_cache = {}
        # Pass 1: Enrich basic attributes & clean up invalid placeholder/logo images
        for p in props:
            raw_dict = {
                "id": p.id,
                "title": p.title,
                "url": p.url,
                "price": p.price,
                "site": p.site
            }
            enriched = enrich_property(raw_dict)
            enriched_cache[p.id] = enriched
            
            p.numeric_price = enriched.get("numeric_price")
            p.typology = enriched.get("typology")
            p.property_type = enriched.get("property_type")
            p.parish = enriched.get("parish")
            p.area_m2 = enriched.get("area_m2")
            p.price_per_m2 = enriched.get("price_per_m2")
            p.condition = enriched.get("condition")
            p.has_garage = enriched.get("has_garage", False)
            p.has_elevator = enriched.get("has_elevator", False)
            
            if p.image_url and any(bad in p.image_url.lower() for bad in [
                "no-image", "no_image", "noimage", "s=0x64", "s=64x", "s=0x32", "s=120x"
            ]):
                p.image_url = None

            if not p.last_seen_at:
                p.last_seen_at = p.found_at
            if p.is_active is None:
                p.is_active = True

        session.commit()

    # Compute benchmarks now that all properties have parish, typology, and numeric_price
    benchmarks = get_market_benchmarks()

    with get_session() as session:
        props = session.query(Property).all()
        updated_count = 0
        for p in props:
            enriched = enriched_cache.get(p.id) or enrich_property({
                "id": p.id, "title": p.title, "url": p.url, "price": p.price, "site": p.site
            })
            eval_data = evaluate_property_opportunity(enriched, benchmarks)
            p.opportunity_score = eval_data.get("score", 50)
            updated_count += 1
            if updated_count % 100 == 0:
                logger.info(f"Scored {updated_count}/{len(props)} properties...")

        session.commit()
        logger.info(f"✅ Successfully backfilled and scored {updated_count} properties in the database!")

if __name__ == "__main__":
    run_backfill()
