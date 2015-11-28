import psycopg2
import re
import csv

def load(conn, fname):
    cur = conn.cursor()

    f = open(fname, 'r')

    reader = csv.reader(f, delimiter=',', quotechar='"')
    for line in reader:
	if line[0] != "Hub":
	    #print line[12]
	    cur.execute("""INSERT INTO occresults (hub, dataset, rank, pattern, sig, seq, start_pos, end_pos, prot_len, match, variant, mismatch, description, cons, homnum, globid, locid, hyd, iup, sa, pepseq, pepdesign) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""", (line[0], line[1], line[2], line[3], line[4], line[5], line[6], line[7], line[8], line[9], line[10], line[11], line[12], line[13], line[14], line[15], line[16], line[17], line[18], line[19], line[20], line[21]))

    conn.commit()

    cur.close()

