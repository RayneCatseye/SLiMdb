import psycopg2
import re

def load(conn, fname):
    cur = conn.cursor()

    f = open(fname, 'r')

    line = f.readline()
    while line:
	if line[0] == ">":
	    line = line.split(' ', 1)
	    name = line[0][1:]
	    desc = line[1][:-1]
            #print("%s // %s" % (name, desc))
            cur.execute("""INSERT INTO human_loci (gene_name, gene_description) VALUES (%s, %s)""", (name, desc))
            #		print name, desc

#	    try:

#	    except:
#		print ("Dupication error, oops.")
	line = f.readline()

    conn.commit()

    cur.close()

