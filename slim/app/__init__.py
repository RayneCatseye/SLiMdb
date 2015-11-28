from flask import Flask

flask_cfg = {
    "DATABASE" : "dbname=slimdb user=slimdb password=slimdb",
    "DEBUG" : True
}

app = Flask('slimdb', debug=True)
app.config.from_object(flask_cfg)


