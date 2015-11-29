from flask import render_template, request, redirect, url_for, g
import urllib

from slimdb import slimdb_app
import dataset

def path_component(name):
    return urllib.quote_plus(name.strip())

@slimdb_app.route("/")
def index():
    return render_template("index.html")

# Search and display data from the `gene` table.
@slimdb_app.route("/gene", methods=["GET", "POST"])
@slimdb_app.route("/gene/<gene_name>", methods=["GET", "POST"])
def by_gene(gene_name=None):
    if request.method == "POST":
        gene_name = request.form.get("gene_name", "").strip()
        if gene_name:
            pcs = { "gene_name" : path_component(gene_name) }
            return redirect(url_for("by_gene", **pcs))
    genes = []
    if gene_name:
        genes = dataset.gene.search(g.db, gene_name)
    return render_template("gene.html", gene_name=gene_name, gene_cols=dataset.gene.cols, genes=genes)

# Search and display data from the `pfam_domain` table.
@slimdb_app.route("/domain", methods=["GET", "POST"])
@slimdb_app.route("/domain/<domain_name>", methods=["GET", "POST"])
def by_domain(domain_name=None):
    if request.method == "POST":
        domain_name = request.form.get("domain_name", "").strip()
        if domain_name:
            pcs = { "domain_name" : path_component(domain_name) }
            return redirect(url_for("by_domain", **pcs))
    domains = []
    if domain_name:
        domains = dataset.domain.search(g.db, domain_name)
    print(domains)
    return render_template("domain.html", domain_name=domain_name, domain_cols=dataset.domain.cols, domains=domains)

# Search and display data from the `occ_results` table.
@slimdb_app.route("/pattern", methods=["GET", "POST"])
@slimdb_app.route("/pattern/<pattern_name>", methods=["GET", "POST"])
def by_pattern(pattern_name=None):
    if request.method == "POST":
        pattern_name = request.form.get("pattern_name", "").strip()
        if pattern_name:
            pcs = { "pattern_name" : path_component(pattern_name) }
            return redirect(url_for("by_pattern", **pcs))
    return render_template("pattern.html", pattern_name=pattern_name, patterns=[])
