#!/usr/bin/env python

import psycopg2
import re


try:
	conn = psycopg2.connect(database="test", user="rayne")
except:
	print "Unable to connect to database"

cur = conn.cursor()

f = open('MainData/humsf09.domain_ppi.090505.tdt', 'r')

line = f.readline()
line = f.readline()
while line:
	line = re.split(r'\t', line)
	interactions = list(re.split(r',', line[4]))
	names = (line[1], line[2]) # names
	evidence = line[5]
	evidence = list(re.split(r'\|', evidence))	
	print interactions
	cur.execute("""INSERT INTO domain_protein_interactions (domain_name, gene_name, evidence, ppi, y2h, bin, com, interacting_hubs) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)""", (line[0], '|'.join(names), evidence, line[6], line[7], line[8], line[9], interactions))
	line = f.readline()

conn.commit()

cur.close()
conn.close()
