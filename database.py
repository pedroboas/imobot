import os
from sqlalchemy import create_engine, Column, String, DateTime, Integer, Float, Text, Boolean, Index, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import datetime, timezone
from contextlib import contextmanager

# Fetch database connection string from environment
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://user:password@imobot_db:5432/scraper")

# SQLAlchemy Setup
engine = create_engine(DATABASE_URL, pool_pre_ping=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()


class Property(Base):
    """
    SQLAlchemy model representing a real estate property listing with analytics attributes.
    """
    __tablename__ = "properties"
    id = Column(String, primary_key=True, index=True)
    site = Column(String, index=True)
    title = Column(String)
    url = Column(String)
    price = Column(String)
    numeric_price = Column(Integer, index=True, nullable=True)
    typology = Column(String, index=True, nullable=True)          # e.g., 'T2', 'T3'
    property_type = Column(String, index=True, nullable=True)     # 'Apartamento', 'Moradia', etc.
    parish = Column(String, index=True, nullable=True)            # Freguesia
    area_m2 = Column(Integer, nullable=True)                      # Área útil / bruta
    price_per_m2 = Column(Float, nullable=True)                   # Preço por m²
    condition = Column(String, nullable=True)                     # 'Novo', 'Usado', 'Restauro'
    has_garage = Column(Boolean, default=False)
    has_elevator = Column(Boolean, default=False)
    opportunity_score = Column(Integer, default=50)               # 0-100 score
    image_url = Column(String, nullable=True)
    found_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
    last_seen_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
    is_active = Column(Boolean, default=True)

    __table_args__ = (
        Index('ix_properties_parish_typology', 'parish', 'typology'),
        Index('ix_properties_score', 'opportunity_score'),
    )


class PriceHistory(Base):
    """
    Tracks price changes over time for existing listings (e.g. price drops).
    """
    __tablename__ = "price_history"
    
    id = Column(Integer, primary_key=True, autoincrement=True)
    property_id = Column(String, index=True)
    old_price = Column(String)
    old_numeric_price = Column(Integer)
    new_price = Column(String)
    new_numeric_price = Column(Integer)
    change_amount = Column(Integer)       # e.g., -15000
    change_pct = Column(Float)            # e.g., -5.77 (%)
    detected_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

    __table_args__ = (
        Index('ix_price_history_detected_at', 'detected_at'),
        Index('ix_price_history_prop', 'property_id'),
    )


class ScrapeLog(Base):
    """
    Tracks each scraping attempt per URL.
    Useful for debugging which sites work, which fail, and performance trends.
    """
    __tablename__ = "scrape_logs"
    
    id = Column(Integer, primary_key=True, autoincrement=True)
    run_id = Column(String, index=True)         # Groups all URLs from same scrape cycle
    url = Column(Text)                           # The search URL that was scraped
    site = Column(String, index=True)            # Site domain (e.g., 'remax', 'era')
    status = Column(String)                      # 'success', 'blocked', 'error', 'empty'
    found_count = Column(Integer, default=0)     # Total properties found by parser
    valid_count = Column(Integer, default=0)     # Properties that passed price filter
    new_count = Column(Integer, default=0)       # New properties saved to DB
    error_message = Column(Text, nullable=True)  # Error details if failed
    html_size = Column(Integer, default=0)       # Size of HTML received (helps debug empty pages)
    parser_name = Column(String, nullable=True)  # Which parser was used
    duration_seconds = Column(Integer, default=0) # How long the scrape took
    cookie_dismissed = Column(Boolean, default=False) # Whether cookie consent was found
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

    __table_args__ = (
        Index('ix_scrape_logs_created_at', 'created_at'),
        Index('ix_scrape_logs_run_site', 'run_id', 'site'),
    )


class RunSummary(Base):
    """
    Summary record for each complete scrape cycle.
    """
    __tablename__ = "run_summaries"
    
    id = Column(Integer, primary_key=True, autoincrement=True)
    run_id = Column(String, unique=True, index=True)
    total_urls = Column(Integer, default=0)
    success_count = Column(Integer, default=0)
    error_count = Column(Integer, default=0)
    blocked_count = Column(Integer, default=0)
    total_found = Column(Integer, default=0)
    total_new = Column(Integer, default=0)
    duration_seconds = Column(Integer, default=0)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))


def init_db():
    """
    Creates the database tables and runs schema migrations safely.
    """
    Base.metadata.create_all(bind=engine)
    from sqlalchemy import text
    with engine.connect() as conn:
        columns_to_add = [
            ("image_url", "VARCHAR"),
            ("numeric_price", "INTEGER"),
            ("typology", "VARCHAR"),
            ("property_type", "VARCHAR"),
            ("parish", "VARCHAR"),
            ("area_m2", "INTEGER"),
            ("price_per_m2", "FLOAT"),
            ("condition", "VARCHAR"),
            ("has_garage", "BOOLEAN DEFAULT FALSE"),
            ("has_elevator", "BOOLEAN DEFAULT FALSE"),
            ("opportunity_score", "INTEGER DEFAULT 50"),
            ("last_seen_at", "TIMESTAMP WITH TIME ZONE"),
            ("is_active", "BOOLEAN DEFAULT TRUE"),
        ]
        for col_name, col_type in columns_to_add:
            try:
                conn.execute(text(f"ALTER TABLE properties ADD COLUMN IF NOT EXISTS {col_name} {col_type};"))
                conn.commit()
            except Exception:
                pass


@contextmanager
def get_session():
    """
    Context manager for safe database session management.
    """
    session = SessionLocal()
    try:
        yield session
    finally:
        session.close()


def is_property_new(prop_id):
    """
    Checks if a property ID already exists in the database.
    """
    with get_session() as session:
        return session.query(Property).filter(Property.id == prop_id).first() is None


def get_property(prop_id):
    """
    Retrieves a single property record by ID.
    """
    with get_session() as session:
        prop = session.query(Property).filter(Property.id == prop_id).first()
        if prop:
            return {
                "id": prop.id,
                "site": prop.site,
                "title": prop.title,
                "url": prop.url,
                "price": prop.price,
                "numeric_price": prop.numeric_price,
                "typology": prop.typology,
                "property_type": prop.property_type,
                "parish": prop.parish,
                "area_m2": prop.area_m2,
                "price_per_m2": prop.price_per_m2,
                "condition": prop.condition,
                "has_garage": prop.has_garage,
                "has_elevator": prop.has_elevator,
                "opportunity_score": prop.opportunity_score,
                "image_url": prop.image_url,
                "found_at": prop.found_at,
                "last_seen_at": prop.last_seen_at,
                "is_active": prop.is_active
            }
        return None


def save_property(prop_id, site, title, url, price, image_url=None,
                  numeric_price=None, typology=None, property_type=None,
                  parish=None, area_m2=None, price_per_m2=None,
                  condition=None, has_garage=False, has_elevator=False,
                  opportunity_score=50):
    """
    Persists a new enriched property listing to the database.
    """
    with get_session() as session:
        try:
            now = datetime.now(timezone.utc)
            new_prop = Property(
                id=prop_id,
                site=site,
                title=title,
                url=url,
                price=price,
                numeric_price=numeric_price,
                typology=typology,
                property_type=property_type,
                parish=parish,
                area_m2=area_m2,
                price_per_m2=price_per_m2,
                condition=condition,
                has_garage=has_garage,
                has_elevator=has_elevator,
                opportunity_score=opportunity_score,
                image_url=image_url,
                found_at=now,
                last_seen_at=now,
                is_active=True
            )
            session.add(new_prop)
            session.commit()
        except Exception as e:
            session.rollback()
            raise e


def update_property_price_and_seen(prop_id, new_price, new_numeric_price, old_price=None, old_numeric_price=None):
    """
    Updates property price, records price history if changed, and refreshes last_seen_at.
    """
    with get_session() as session:
        try:
            prop = session.query(Property).filter(Property.id == prop_id).first()
            if not prop:
                return None
                
            now = datetime.now(timezone.utc)
            prop.last_seen_at = now
            prop.is_active = True
            
            old_p_num = old_numeric_price or prop.numeric_price or 0
            old_p_str = old_price or prop.price or ""
            
            price_drop = None
            if new_numeric_price and old_p_num and new_numeric_price != old_p_num:
                change_amount = new_numeric_price - old_p_num
                change_pct = round(((new_numeric_price - old_p_num) / old_p_num) * 100, 2)
                
                # Record price history event
                history = PriceHistory(
                    property_id=prop_id,
                    old_price=old_p_str,
                    old_numeric_price=old_p_num,
                    new_price=new_price,
                    new_numeric_price=new_numeric_price,
                    change_amount=change_amount,
                    change_pct=change_pct,
                    detected_at=now
                )
                session.add(history)
                
                prop.price = new_price
                prop.numeric_price = new_numeric_price
                if prop.area_m2 and prop.area_m2 > 0:
                    prop.price_per_m2 = round(new_numeric_price / prop.area_m2, 2)
                    
                if change_amount < 0:
                    price_drop = {
                        "old_price": old_p_str,
                        "new_price": new_price,
                        "change_amount": change_amount,
                        "change_pct": change_pct
                    }
            elif new_numeric_price and not prop.numeric_price:
                prop.numeric_price = new_numeric_price
                if prop.area_m2 and prop.area_m2 > 0:
                    prop.price_per_m2 = round(new_numeric_price / prop.area_m2, 2)
                    
            session.commit()
            return price_drop
        except Exception as e:
            session.rollback()
            raise e


def update_property_seen(prop_id):
    """
    Refreshes last_seen_at for an existing property.
    """
    with get_session() as session:
        try:
            prop = session.query(Property).filter(Property.id == prop_id).first()
            if prop:
                prop.last_seen_at = datetime.now(timezone.utc)
                prop.is_active = True
                session.commit()
        except Exception:
            session.rollback()


def save_scrape_log(run_id, url, site, status, found_count=0, valid_count=0,
                     new_count=0, error_message=None, html_size=0,
                     parser_name=None, duration_seconds=0, cookie_dismissed=False):
    """
    Records a scrape attempt for a single URL.
    """
    with get_session() as session:
        try:
            log = ScrapeLog(
                run_id=run_id, url=url, site=site, status=status,
                found_count=found_count, valid_count=valid_count,
                new_count=new_count, error_message=error_message,
                html_size=html_size, parser_name=parser_name,
                duration_seconds=duration_seconds,
                cookie_dismissed=cookie_dismissed
            )
            session.add(log)
            session.commit()
        except Exception:
            session.rollback()


def save_run_summary(run_id, total_urls, success_count, error_count,
                      blocked_count, total_found, total_new, duration_seconds):
    """
    Records a summary for a complete scrape cycle.
    """
    with get_session() as session:
        try:
            summary = RunSummary(
                run_id=run_id, total_urls=total_urls,
                success_count=success_count, error_count=error_count,
                blocked_count=blocked_count, total_found=total_found,
                total_new=total_new, duration_seconds=duration_seconds
            )
            session.add(summary)
            session.commit()
        except Exception:
            session.rollback()

