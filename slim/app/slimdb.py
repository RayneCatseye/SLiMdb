from flask import Flask, render_template, request, redirect, url_for

import urllib

flask_cfg = {
    "DATABASE" : "dbname=slimdb user=slimdb password=slimdb"
}

ui = Flask('slimdb')
ui.config.from_object(flask_cfg)
ui.debug = True

def path_component(name):
    return urllib.quote_plus(name.strip())

@ui.route("/")
def index():
    return render_template("index.html")

# Search and display data from the `gene` table.
@ui.route("/gene", methods=["GET", "POST"])
@ui.route("/gene/<gene_name>", methods=["GET", "POST"])
def by_gene(gene_name=None):
    if request.method == "POST":
        gene_name = request.form.get("gene_name", "").strip()
        if gene_name:
            pcs = { "gene_name" : path_component(gene_name) }
            return redirect(url_for("by_gene", **pcs))
    return render_template("gene.html", gene_name=gene_name, genes=[])

# Search and display data from the `pfam_domain` table.
@ui.route("/domain", methods=["GET", "POST"])
@ui.route("/domain/<domain_name>", methods=["GET", "POST"])
def by_domain(domain_name=None):
    if request.method == "POST":
        domain_name = request.form.get("domain_name", "").strip()
        if domain_name:
            pcs = { "domain_name" : path_component(domain_name) }
            return redirect(url_for("by_domain", **pcs))
    return render_template("domain.html", domain_name=domain_name, domains=[])

# Search and display data from the `occ_results` table.
@ui.route("/pattern", methods=["GET", "POST"])
@ui.route("/pattern/<pattern_name>", methods=["GET", "POST"])
def by_pattern(pattern_name=None):
    if request.method == "POST":
        pattern_name = request.form.get("pattern_name", "").strip()
        if pattern_name:
            pcs = { "pattern_name" : path_component(pattern_name) }
            return redirect(url_for("by_pattern", **pcs))
    return render_template("pattern.html", pattern_name=pattern_name, patterns=[])




