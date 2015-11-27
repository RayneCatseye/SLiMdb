#!/usr/bin/env python

# Adds Domain Protein Interactions data to the database

import psycopg2
import re


try:
	conn = psycopg2.connect(database="slimdbtest", user="rayne")
except:
	print "Unable to connect to database"

cur = conn.cursor()

f = open('../datasets/MainData/humsf09.domain_ppi.090505.tdt', 'r')

line = f.readline()
line = f.readline()
while line:
	line = re.split(r'\t', line)
	interactions = list(re.split(r',', line[4]))
	names = (line[1], line[2]) # names
	evidence = line[5]
	evidence = list(re.split(r'\|', evidence))	
	# First, put the domain protein interaction table together as a whole
	cur.execute("""INSERT INTO domain_protein_interactions (domain_name, gene_name, evidence, ppi, y2h, bin, com, interacting_hubs) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)""", (line[0], '|'.join(names), evidence, line[6], line[7], line[8], line[9], interactions))
	conn.commit()

	# Now add the pure interaction table between domains and proteins
	for i in interactions:
		cur.execute("""SELECT COUNT(*) FROM gene_pfam_domain WHERE gene_name='%s' AND pfam_domain_name='%s'""" % (i, line[0]))
		n = len(cur.fetchall())
		if not n:
			cur.execute("""INSERT INTO gene_pfam_domain VALUES (%s, %s)""", (i, line[0]))

	line = f.readline()

conn.commit()

cur.close()
conn.close()
