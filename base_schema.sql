--------------------------
--		GENE DATA		--
--------------------------
/*
-- Gene table; remember to include the pfam domains and such
CREATE TABLE gene (
);


CREATE TABLE gene_protein_interactions (
	-- Interactions
	gene_name VARCHAR(32),
	domain_name VARCHAR(64),
	interacting_hubs VARCHAR(128)[],
	evidence VARCHAR(256),
	-- Hub SLiMs
	ppi VARCHAR(32),
	y2h VARCHAR(32),
	bin VARCHAR(32),
	com VARCHAR(32),
	PRIMARY KEY (domain_name, gene_name)
);

--------------------------
--		DOMAIN DATA		--
--------------------------

CREATE TABLE pfam_domain (
);

CREATE TABLE domain_protein_interactions (
	-- Interactions
	domain_name VARCHAR(64),
	gene_name VARCHAR(64),
	interacting_hubs VARCHAR(128)[],
	evidence VARCHAR(256)[],
	-- Hub SLiMs
	ppi VARCHAR(32),
	y2h VARCHAR(32),
	bin VARCHAR(32),
	com VARCHAR(32),
	PRIMARY KEY (domain_name, gene_name)
);
*/
------------------------------
--		PATTERN DATA		--
------------------------------

CREATE TABLE occresults (
	hub VARCHAR(64),
	dataset VARCHAR(64),
	rank VARCHAR(64),
	pattern VARCHAR(64),
	sig VARCHAR(64),
	seq VARCHAR(64),
	start_pos VARCHAR(64),
	end_pos VARCHAR(64),
	prot_len VARCHAR(64),
	match VARCHAR(64),
	variant VARCHAR(64),
	mismatch VARCHAR(64),
	description VARCHAR(2056),
	cons VARCHAR(64),
	homnum VARCHAR(64),
	globid VARCHAR(64),
	locid VARCHAR(64),
	hyd VARCHAR(64),
	iup VARCHAR(64),
	sa VARCHAR(64),
	pepseq VARCHAR(64),
	pepdesign VARCHAR(64),
	PRIMARY KEY (dataset, pattern, seq, start_pos)
);

----------------------------------
--		INTERACTION DATA		--
----------------------------------
/*
-- interaction table between the gene and pfam_domain tables
CREATE TABLE gene_pfam_domain (
	gene_name VARCHAR(32),
	pfam_domain_name VARCHAR(64),
	PRIMARY KEY (gene_name, pfam_domain_name)
);

-- gene to protein
CREATE TABLE gene_protein (
	protein_name VARCHAR(32),
	gene_name VARCHAR(32) REFERENCES gene (name),
	PRIMARY KEY (pattern_name, gene_name, is_hub)

);
*/
