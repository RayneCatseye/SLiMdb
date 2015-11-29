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
    return render_template("domain.html", domain_name=domain_name, domain_cols=dataset.domain.cols, domains=domains)

# Search and display data from the `occresults` table.
@slimdb_app.route("/pattern", methods=["GET", "POST"])
@slimdb_app.route("/pattern/<pattern>", methods=["GET", "POST"])
def by_pattern(pattern=None):
    if request.method == "POST":
        pattern = request.form.get("pattern", "").strip()
        if pattern:
            pcs = { "pattern" : path_component(pattern) }
            return redirect(url_for("by_pattern", **pcs))
    patterns = []
    if pattern:
        patterns = dataset.pattern.search(g.db, pattern)
    return render_template("pattern.html", pattern=pattern, pattern_cols=dataset.pattern.cols, patterns=patterns)

