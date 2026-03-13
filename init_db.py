import sqlite3
import pandas as pd
from contextlib import contextmanager

DB_PATH = 'data/SectorMineroEnergeticoColombia.db'

@contextmanager
def get_connection():
    """Context manager para conexiones a la base de datos"""
    conn = sqlite3.connect(DB_PATH)
    try:
        yield conn
    finally:
        conn.close()

def execute_query(query: str) -> pd.DataFrame:
    """Ejecutar consulta y retornar DataFrame"""
    with get_connection() as conn:
        return pd.read_sql_query(query, conn)

def get_table_names() -> list:
    """Obtener nombres de todas las tablas"""
    query = "SELECT name FROM sqlite_master WHERE type='table';"
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute(query)
        return [row[0] for row in cursor.fetchall()]