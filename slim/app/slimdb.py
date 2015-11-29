from flask import Flask, render_template

flask_cfg = {
    "DATABASE" : "dbname=slimdb user=slimdb password=slimdb"
}

ui = Flask('slimdb')
ui.config.from_object(flask_cfg)
ui.debug = True

@ui.route("/")
def index():
    return render_template("index.html")


