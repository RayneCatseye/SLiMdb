
-- Gene table; remember to include the pfam domains and such
CREATE TABLE gene (
	name VARCHAR(32) PRIMARY KEY,
	description VARCHAR(512),
	-- TODO: Add UPC info here (needs its own table or two)
	unifake VARCHAR
);

CREATE TABLE pfam_domain (
	name VARCHAR(64) PRIMARY KEY,
	description VARCHAR(512)
	-- TODO: Add UPC info here (needs its own table or two)
);

-- interaction table between the gene and pfam_domain tables
CREATE TABLE gene_pfam_domain (
	gene_name VARCHAR(32),
	pfam_domain_name VARCHAR(64),
	PRIMARY KEY (gene_name, pfam_domain_name)
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
	pep_design VARCHAR(16)
);

-- Domain hub results summary
CREATE TABLE domain_hub_summary (
	dataset VARCHAR(64),
	pattern VARCHAR(32),
	PRIMARY KEY (dataset, pattern),
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
	cm INTEGER

)
