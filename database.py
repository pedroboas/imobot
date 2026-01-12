"""
Database Management Module
--------------------------
Handles persistence of scraped property listings using SQLAlchemy ORM.
Ensures no duplicate records are processed and provides safe session handling.
"""

import os
from sqlalchemy import create_engine, Column, String, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import datetime
from contextlib import contextmanager

# Fetch database connection string from environment
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://user:password@db:5432/scraper")

# SQLAlchemy Setup
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class Property(Base):
    """
    SQLAlchemy model representing a real estate property listing.
    """
    __tablename__ = "properties"
    id = Column(String, primary_key=True, index=True)
    site = Column(String)
    title = Column(String)
    url = Column(String)
    price = Column(String)
    found_at = Column(DateTime, default=datetime.utcnow)

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
