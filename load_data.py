#! /usr/bin/env python2

import sys
import psycopg2

import slim.db.occ_data as occ
import slim.db.gene_data as gene
import slim.db.gene_protein_data as gene_protein
import slim.db.domain_ppi_data as domain_ppi
import slim.db.main_data as main_data

def main(argv):
    if len(argv) < 2:
        print("usage: %s <pgsql connection string>", argv[0])
    try:
        conn = psycopg2.connect(argv[1])
    except psycopg2.OperationalError as e:
        print("Unable to connect to database:")
        print(e)
        sys.exit(1)

    print("loading domain_ppi")
    domain_ppi.load(conn, "datasets/MainData/humsf09.domain_ppi.090505.tdt")

# FIXME: not implemented
#    gene_protein.load(conn, "datasets/MainData/humsf09_slimfinder.occ.csv")

    print("loading gene")
    gene.load(conn, "datasets/MainData/ens_HUMAN.loci.fas")
    print("loading main")
    main_data.load(conn, "datasets/MainData/humsf09_slimfinder.full.csv")
    print("loading occ")
    occ.load(conn, "datasets/MainData/humsf09_slimfinder.occ.csv")
    conn.close()
    
    
    

main(sys.argv)
