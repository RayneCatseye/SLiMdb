import psycopg2
import re

def load(conn, fname):
    cur = conn.cursor()

    f = open(fname, 'r')

    line = f.readline()

    # FASTA format. We read the gene name and description and discard the
    # sequence data.
    while line:
	if line[0] == ">":
	    line = line.split(' ', 1)
	    name = line[0][1:]
	    desc = line[1][:-1]
            cur.execute("""INSERT INTO human_loci (gene_name, gene_description) VALUES (%s, %s)""", (name, desc))
	line = f.readline()

    conn.commit()

    cur.close()

