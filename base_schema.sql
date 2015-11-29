--------------------------
--		GENE DATA		--
--------------------------

DROP TABLE IF EXISTS gene;

-- Gene table 
CREATE TABLE gene (
	dataset VARCHAR(64),
	runid VARCHAR(64),
	masking VARCHAR(64),
	build VARCHAR(64),
	chance VARCHAR(64),
	runtime VARCHAR(64),
	seqnum VARCHAR(64),
	upnum VARCHAR(64),
	aanum VARCHAR(64),
	motnum VARCHAR(64),
	rank VARCHAR(64),
	sig	 VARCHAR(64),
	fdr VARCHAR(64),
	wtfdr VARCHAR(64),
	seqwt VARCHAR(64),
	pattern VARCHAR(64),
	ic VARCHAR(64),
	occ VARCHAR(64),
	support VARCHAR(64),
	up VARCHAR(64),
	expup VARCHAR(64),
	prob VARCHAR(64),
	cloud VARCHAR(64),
	cloudseq VARCHAR(64),
	cloudup VARCHAR(64),
	consmean VARCHAR(64),
	homnummean VARCHAR(64),
	globidmean VARCHAR(64),
	locidmean VARCHAR(64),
	hydmean VARCHAR(64),
	iupmean VARCHAR(64),
	samean VARCHAR(64),
	original VARCHAR(64),
	dtype VARCHAR(64),
	hub VARCHAR(64),
	ppiset VARCHAR(64),
	annotation VARCHAR(64),
	class VARCHAR(64),
	elm VARCHAR(64),
	bestelm VARCHAR(64),
	elmsim VARCHAR(64),
	elmpattern VARCHAR(64),
	score VARCHAR(64),
	matched VARCHAR(64),
	matchic VARCHAR(64),
	kcloud VARCHAR(64),
	dcloud VARCHAR(64),
	analysis VARCHAR(64),
	PRIMARY KEY (dataset, pattern, rank)
); 


--------------------------
--		DOMAIN DATA		--
--------------------------

DROP TABLE IF EXISTS pfam_domain;

CREATE TABLE pfam_domain (
	dataset VARCHAR(64),
	runid VARCHAR(64),
	masking VARCHAR(64),
	build VARCHAR(64),
	chance VARCHAR(64),
	runtime VARCHAR(64),
	seqnum VARCHAR(64),
	upnum VARCHAR(64),
	aanum VARCHAR(64),
	motnum VARCHAR(64),
	rank VARCHAR(64),
	sig	 VARCHAR(64),
	fdr VARCHAR(64),
	wtfdr VARCHAR(64),
	seqwt VARCHAR(64),
	pattern VARCHAR(64),
	ic VARCHAR(64),
	occ VARCHAR(64),
	support VARCHAR(64),
	up VARCHAR(64),
	expup VARCHAR(64),
	prob VARCHAR(64),
	cloud VARCHAR(64),
	cloudseq VARCHAR(64),
	cloudup VARCHAR(64),
	consmean VARCHAR(64),
	homnummean VARCHAR(64),
	globidmean VARCHAR(64),
	locidmean VARCHAR(64),
	hydmean VARCHAR(64),
	iupmean VARCHAR(64),
	samean VARCHAR(64),
	original VARCHAR(64),
	dtype VARCHAR(64),
	hub VARCHAR(64),
	ppiset VARCHAR(64),
	annotation VARCHAR(64),
	class VARCHAR(64),
	elm VARCHAR(64),
	bestelm VARCHAR(64),
	elmsim VARCHAR(64),
	elmpattern VARCHAR(64),
	score VARCHAR(64),
	match VARCHAR(64),
	matchic VARCHAR(64),
	kcloud VARCHAR(64),
	dcloud VARCHAR(64),
	analysis VARCHAR(64),
	PRIMARY KEY (dataset, pattern, rank)
);


------------------------------
--		PATTERN DATA		--
------------------------------

DROP TABLE IF EXISTS occresults;

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

DROP TABLE IF EXISTS gene_pfam_domain;

-- interaction table between the gene and pfam_domain tables

CREATE TABLE gene_pfam_domain (
	gene_name VARCHAR(32),
	pfam_domain_name VARCHAR(64),
	PRIMARY KEY (gene_name, pfam_domain_name)
);

/*
DROP TABLE IF EXISTS gene_protein;

-- gene to protein
CREATE TABLE gene_protein (
	protein_name VARCHAR(32),
	gene_name VARCHAR(32) REFERENCES gene (name),
	PRIMARY KEY (pattern_name, gene_name, is_hub)

);
*/

DROP TABLE IF EXISTS domain_protein_interactions;

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

DROP TABLE IF EXISTS human_loci;

CREATE TABLE human_loci(
	gene_name VARCHAR(128),
	gene_description VARCHAR(2048),
    PRIMARY KEY (gene_name)
);


