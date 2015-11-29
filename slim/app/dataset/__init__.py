import psycopg2

import gene
import domain

def connect_db(pgsql_conn):
    try:
        conn = psycopg2.connect(pgsql_conn)
    except psycopg2.OperationalError as e:
        print("Could not connect to database: %s", str(e))
        return None
    return conn
