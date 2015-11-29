#!/usr/bin/env python

# Splits the main.csv file into genes and domains, then puts them in the db accordingly

import psycopg2
import re
import csv

def load(conn, fname):
    cur = conn.cursor()

    f = open(fname, 'r')

    reader = csv.reader(f, delimiter=',', quotechar='"')
    for line in reader:
	if line[0] != "Dataset":
	    regexp = re.compile(r'.dom.')
	    if regexp.search(line[0]) is not None: #match, this is a domain line
		data = map(lambda f:"'"+f+"'", line)
		q= 'INSERT INTO pfam_domain VALUES (%s) ' % ",".join(data)
		cur.execute(q)
	    else:
		data = map(lambda f:"'"+f+"'", line)
		q= 'INSERT INTO gene VALUES (%s) ' % ",".join(data)
		cur.execute(q)
    conn.commit()

    cur.close()

