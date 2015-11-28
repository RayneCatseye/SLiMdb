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
            #		print name, desc

	    try:
		cur.execute("""INSERT INTO gene (name, description) VALUES (%s, %s)""", (name, desc))
	    except:
		print ("Dupication error, oops.")
	line = f.readline()

    conn.commit()

    cur.close()

