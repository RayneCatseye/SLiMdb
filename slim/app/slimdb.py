from flask import Flask, render_template, request, redirect, url_for

flask_cfg = {
    "DATABASE" : "dbname=slimdb user=slimdb password=slimdb"
}

ui = Flask('slimdb')
ui.config.from_object(flask_cfg)
ui.debug = True

@ui.route("/")
def index():
    return render_template("index.html")

# Search and display data from the `gene` table.
@ui.route("/gene", methods=["GET", "POST"])
@ui.route("/gene/<gene_name>")
def by_gene(gene_name=None):
    if request.method == "POST":
        gene_name = request.form.get("gene_name", None)
        print(gene_name)
        print(request.form)
        if gene_name:
            return redirect(url_for("by_gene", gene_name=gene_name))
    return render_template("gene.html", gene_name=gene_name, genes=[])

# Search and display data from the `pfam_domain` table.
@ui.route("/domain", methods=["GET", "POST"])
@ui.route("/domain/<domain_name>")
def by_domain(domain_name=None):
    return render_template("domain.html", domain_name=domain_name, domains=[])

# Search and display data from the `occ_results` table.
@ui.route("/pattern", methods=["GET", "POST"])
@ui.route("/pattern/<pattern_name>")
def by_pattern(pattern_name=None):
    return render_template("pattern.html", pattern_name=pattern_name, patterns=[])




