import psycopg2
import re
import csv

def load(conn, fname):
    cur = conn.cursor()

    f = open('../datasets/MainData/humsf09_slimfinder.occ.csv', 'r')
    g = open('../datasets/MainData/humsf09.genemap.0905050.tdt', 'r')
    reader = csv.reader(f, delimiter=',', quotechar='"')
    for line in reader:
	if line[0] != "Hub":
	    # Second last column of g is the Gene we're looking for
		
	    #print line[12]
	    #cur.execute("""INSERT INTO gene_protein (protein_name, gene_name) VALUES (%s, %s)""", ())
            pass

    conn.commit()
    cur.close()

