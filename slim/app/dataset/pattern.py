from common import *

# FIXME: proper column names for display
cols = [
    "hub",
    "dataset",
    "rank",
    "pattern",
    "sig",
    "seq",
    "start_pos",
    "end_pos",
    "prot_len",
    "match",
    "variant",
    "mismatch",
    "description",
    "cons",
    "homnum",
    "globid",
    "locid",
    "hyd",
    "iup",
    "sa",
    "pepseq",
    "pepdesign",
]

def search(conn, pattern):
    cur = conn.cursor()
    cur.execute("SELECT " + ",".join(cols) + ' FROM occresults WHERE pattern LIKE %s;', (like(pattern),))
    res = cur.fetchall()
    return map(lambda r: dict(zip(cols, list(r))), res)
