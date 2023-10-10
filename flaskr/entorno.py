from flask import (Blueprint, jsonify)
from flaskr.db import get_db

bp = Blueprint('entorno', __name__, url_prefix='/api/entorno')

@bp.route('/')
def index():
    db = get_db()
    entornos = db.execute(
        """SELECT e.id, e.nombre, s.nombre AS peine, s.piso FROM entornos e 
        JOIN sector s ON s.id = e.sector ORDER BY peine, piso, e.nombre"""
    ).fetchall()
    return jsonify(entornos=entornos)

@bp.route('/detalle/<string:nombre>/')
def detail(nombre):
    db = get_db()
    entorno = db.execute(
 """SELECT e.id, e.nombre, s.nombre AS peine, s.piso FROM entornos e 
        JOIN sector s ON s.id = e.sector WHERE e.nombre = ?""" ,
        (nombre,)
    ).fetchone()

    items = db.execute(
        """SELECT id, nombre  
            FROM items 
	        WHERE ubicacion = ?; """,
            (entorno["id"],)
    ).fetchall()

    return jsonify(entorno=entorno, items=items)