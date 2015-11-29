from common import *

# FIXME: proper column names for display
cols = [
    "dataset",
    "runid",
    "masking",
    "build", 
    "chance", 
    "runtime", 
    "seqnum",
    "upnum", 
    "aanum",
    "motnum",
    "rank",
    "sig",
    "fdr",
    "wtfdr",
    "seqwt",
    "pattern",
    "ic",
    "occ",
    "support",
    "up",
    "expup",
    "prob",
    "cloud",
    "cloudseq",
    "cloudup",
    "consmean",
    "homnummean",
    "globidmean",
    "locidmean",
    "hydmean",
    "iupmean",
    "samean",
    "original",
    "dtype",
    "hub",
    "ppiset",
    "annotation",
    "class",
    "elm",
    "bestelm",
    "elmsim",
    "elmpattern",
    "score",
    "matched",
    "matchic",
    "kcloud",
    "dcloud",
    "analysis"
]

def search(conn, gene_name):
    cur = conn.cursor()
    # Looks bad, but cols is trusted and I'm lazy.
    print(gene_name)
    cur.execute("SELECT " + ",".join(cols) + ' FROM gene WHERE dataset LIKE %s;', (like(gene_name),))
    res = cur.fetchall()
    return map(lambda r: dict(zip(cols, list(r))), res)
