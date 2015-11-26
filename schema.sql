------------------------------
--		PATTERN DATA		--
------------------------------

-- Pattern table
CREATE TABLE pattern (
	name VARCHAR(64) PRIMARY KEY,
	description VARCHAR(512),
	random_datasets VARCHAR(32)[],
	unifake VARCHAR
);

CREATE TABLE pattern_hub (
	pattern_name VARCHAR(64),
	dataset VARCHAR(64),
	seqn INTEGER,
	upn INTEGER,
	aa INTEGER,
	rank VARCHAR(16),
	sig FLOAT8,
	fdr FLOAT8,
	class VARCHAR(16),
	ic FLOAT8,
	support VARCHAR(16),
	expup FLOAT8,
	prob VARCHAR(16),
	cloud INTEGER,
	cloudseq INTEGER,
	cloudup INTEGER,
	cons_mean FLOAT8,
	hyd_mean FLOAT8,
	iup_mean FLOAT8,
	sa_mean FLOAT8,
	cm INTEGER,
	PRIMARY KEY (pattern_name, dataset)
);

CREATE TABLE pattern_spoke (
	pattern_name VARCHAR(64),
	spoke VARCHAR(32),
	start_pos INTEGER,
	end_pos INTEGER,
	rank INTEGER,
	dataset VARCHAR(64),
	sig FLOAT8,
	prot_len INTEGER,
	match VARCHAR(32),
	description VARCHAR,
	cons FLOAT8,
	hom_num INTEGER,
	glob_id FLOAT8,
	loc_id FLOAT8,
	hyd FLOAT8,
	iup FLOAT8,
	sa FLOAT8,
	pep_seq VARCHAR(16),
	pep_design VARCHAR(8),
	PRIMARY KEY (pattern_name, spoke, start_pos)
);

CREATE TABLE comparimotif (
	pattern_name VARCHAR(64),
	slim VARCHAR(64),
	motif VARCHAR(64),
	relationship VARCHAR,
	match VARCHAR(16),
	match_pos INTEGER,
	match_ic FLOAT8,
	norm_ic FLOAT8,
	score FLOAT8,
	description VARCHAR,
	PRIMARY KEY (pattern_name, slim, motif)
);

--------------------------
--		GENE DATA		--
--------------------------

-- Gene table; remember to include the pfam domains and such
CREATE TABLE gene (
	name VARCHAR(32) PRIMARY KEY,
	description VARCHAR(512),
	unifake VARCHAR,
	pfam_domains VARCHAR(64)[],
	species VARCHAR(128)
);

-- Hub results summary
CREATE TABLE gene_hub_summary (
	gene_name VARCHAR(32),
	dataset VARCHAR(32),
	seqn INTEGER,
	upn INTEGER,
	aa INTEGER,
	rank VARCHAR(32),
	sig FLOAT8,
	fdr FLOAT8,
	pattern VARCHAR(32),
	class VARCHAR(16),
	ic FLOAT8,
	support VARCHAR(16),
	exp_up FLOAT8,
	prob VARCHAR(16),
	cloud INTEGER,
	cloud_seq INTEGER,
	cloud_up INTEGER,
	cons_mean FLOAT8,
	hyd_mean FLOAT8,
	iup_mean FLOAT8,
	sa_mean FLOAT8,
	cm INTEGER,
	PRIMARY KEY (gene_name, dataset)
);

-- SLiM occurences for hub results
CREATE TABLE gene_hub_results (
	gene_name VARCHAR(32),
	dataset VARCHAR(32),
	spoke VARCHAR(32),
	rank INTEGER,
	pattern VARCHAR(32),
	sig FLOAT8,
	start_pos INTEGER,
	end_pos INTEGER,
	prot_len INTEGER,
	match VARCHAR(32),
	description VARCHAR,
	cons FLOAT8,
	hum_num INTEGER,
	glob_id FLOAT8,
	loc_id FLOAT8,
	hyd FLOAT8,
	iup FLOAT8,
	sa FLOAT8,
	pep_seq VARCHAR(16),
	pep_design VARCHAR(16),
	PRIMARY KEY (gene_name, dataset, spoke, start_pos)
);

-- Spoke results summary for the gene
CREATE TABLE gene_spoke (
	gene_name VARCHAR(32),
	dataset VARCHAR(64),
	rank INTEGER,
	pattern VARCHAR(32),
	sig FLOAT8,
	start_pos INTEGER,
	end_pos INTEGER,
	prot_len INTEGER,
	match VARCHAR(16),
	cons FLOAT8,
	hom_num INTEGER,
	glob_id FLOAT8,
	loc_id FLOAT8,
	hyd FLOAT8,
	iup FLOAT8,
	sa FLOAT8,
	pep_seq VARCHAR(16),
	pep_design VARCHAR(16),
	PRIMARY KEY (gene_name, dataset, rank, start_pos)
);

CREATE TABLE gene_protein_interactions (
	-- Interactions
	gene_name VARCHAR(32),
	domain_name VARCHAR(64),
	interacting_hubs VARCHAR(32)[],
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
	name VARCHAR(64) PRIMARY KEY,
	description VARCHAR(512)
);

-- SLiM Occurrences in the domain
CREATE TABLE slim_occurences (
	spoke VARCHAR(16),
	start_pos INTEGER,
	PRIMARY KEY (spoke, start_pos)
);

-- Relation table between spoke(domain) and hub(protein)
CREATE TABLE domain_hub_gene_spoke (
	domain_hub VARCHAR(64),
	gene_spoke VARCHAR(64),
	start_pos INTEGER,
	end_pos INTEGER,
	rank INTEGER,
	pattern VARCHAR(32),
	sig FLOAT8,
	prot_len INTEGER,
	match VARCHAR(32),
	description VARCHAR (256),
	cons FLOAT8,
	hom_num INTEGER,
	glob_id FLOAT8,
	loc_id FLOAT8,
	hyd FLOAT8,
	iup FLOAT8,
	sa FLOAT8,
	pep_seq VARCHAR(32),
	pep_design VARCHAR(16),
	PRIMARY KEY (domain_hub, gene_spoke, start_pos)
);

-- Domain hub results summary
-- Called "SLiM Occurences" on the site
CREATE TABLE domain_hub_summary (
	dataset VARCHAR(64),
	pattern VARCHAR(32),
	seq_n INTEGER,
	upn INTEGER,
	aa INTEGER,
	rank VARCHAR(16),
	sig FLOAT8,
	fdr FLOAT8,
	class VARCHAR(64),
	ic FLOAT8,
	support VARCHAR(32), -- clicking on this should lead to an image file
	exp_up FLOAT8,
	prob VARCHAR(16),
	cloud INTEGER,
	cloud_seq INTEGER,
	cloud_up INTEGER,
	cons_mean FLOAT8,
	hyd_mean FLOAT8,
	iup_mean FLOAT8,
	sa_mean FLOAT8,
	cm INTEGER,
	PRIMARY KEY (dataset, pattern)
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

----------------------------------
--		INTERACTION DATA		--
----------------------------------

-- interaction table between the gene and pfam_domain tables
CREATE TABLE gene_pfam_domain (
	gene_name VARCHAR(32) REFERENCES gene (name),
	pfam_domain_name VARCHAR(64) REFERENCES  pfam_domain (name),
	PRIMARY KEY (gene_name, pfam_domain_name)
);

-- pattern to gene
CREATE TABLE pattern_gene (
	pattern_name VARCHAR(32) REFERENCES pattern (name),
	gene_name VARCHAR(32) REFERENCES gene (name),
	is_hub BOOLEAN, -- if false, is spoke
	PRIMARY KEY (pattern_name, gene_name, is_hub)

);

-- pattern to domain
CREATE TABLE pattern_domain (
	pattern_name VARCHAR(32) REFERENCES pattern (name),
	domain_name VARCHAR(64) REFERENCES pfam_domain (name),
	PRIMARY KEY (pattern_name, domain_name)
);

------------------
--		UPC		--
------------------

-- Consistent across Domain and Gene
CREATE TABLE upc (
	name VARCHAR(64),
	upc_type VARCHAR(16),
	up INTEGER, -- actually rank
	n INTEGER, -- occurrences
	mst FLOAT8,
	spokes VARCHAR(16)[],
	PRIMARY KEY (name, upc_type, up)
);

----------------------
--		PAPER		--
----------------------

-- Create table to indicate data in papers
CREATE TABLE papers (
	paper_name VARCHAR,
	runs VARCHAR(64)[]
);

