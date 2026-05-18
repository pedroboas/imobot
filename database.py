"""
Database Management Module
--------------------------
Handles persistence of scraped property listings and scraper run logs
using SQLAlchemy ORM. Provides safe session handling and tracking of
scraper performance per site.
"""

import os
from sqlalchemy import create_engine, Column, String, DateTime, Integer, Text, Boolean, Index
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import datetime, timezone
from contextlib import contextmanager

# Fetch database connection string from environment
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://user:password@db:5432/scraper")

# SQLAlchemy Setup
engine = create_engine(DATABASE_URL, pool_pre_ping=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()


class Property(Base):
    """
    SQLAlchemy model representing a real estate property listing.
    """
    __tablename__ = "properties"
    id = Column(String, primary_key=True, index=True)
    site = Column(String, index=True)
    title = Column(String)
    url = Column(String)
    price = Column(String)
    found_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))


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
    Creates the database tables if they do not exist.
    """
    Base.metadata.create_all(bind=engine)


@contextmanager
def get_session():
    """
    Context manager for safe database session management.
    Ensures that sessions are closed after use, preventing memory leaks.
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


def save_property(prop_id, site, title, url, price):
    """
    Persists a new property listing to the database.
    """
    with get_session() as session:
        try:
            new_prop = Property(id=prop_id, site=site, title=title, url=url, price=price)
            session.add(new_prop)
            session.commit()
        except Exception as e:
            session.rollback()
            raise e


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
