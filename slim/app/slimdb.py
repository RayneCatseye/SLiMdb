from flask import Flask, g

import urllib

from dataset import connect_db
import config

slimdb_app = Flask('slimdb')
slimdb_app.config.from_object(config)
slimdb_app.debug = True

@slimdb_app.before_request
def before_request():
    g.db = connect_db(slimdb_app.config["DATABASE"])

@slimdb_app.teardown_request
def teardown_request(exception):
    db = getattr(g, 'db', None)
    if db is not None:
        db.close()



