import os

from flask import Flask, jsonify, url_for
from flask_cors import CORS, cross_origin

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)

    CORS(app)

    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    from . import db, entorno, item
    db.init_app(app)
    app.register_blueprint(entorno.bp)
    app.register_blueprint(item.bp)

    return app
