#!/usr/bin/env python

# This script adds the gene name and description to the gene table of the database

import psycopg2
import re


try:
	conn = psycopg2.connect(database="slimdbtest", user="rayne")
except:
	print "Unable to connect to database"

cur = conn.cursor()

f = open('../datasets/MainData/ens_HUMAN.loci.fas', 'r')

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
conn.close()

