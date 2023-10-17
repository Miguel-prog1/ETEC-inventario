from flask import (Blueprint, abort, jsonify, request, url_for)
from flaskr.db import get_db

bp = Blueprint('entorno', __name__, url_prefix='/api/entornos')

@bp.route('/', methods=('GET', 'POST'))
def index():
    db = get_db()
    if request.method == 'GET':
        entornos = db.execute(
            """SELECT e.id, e.nombre, s.nombre AS peine, s.piso FROM entornos e 
            JOIN sectores s ON s.id = e.sector ORDER BY peine, piso, e.nombre"""
        ).fetchall()
        return jsonify(entornos=entornos)
    elif request.method == 'POST':
        entorno = request.json['entorno']
        nombre = entorno['nombre']
        sector = entorno['sector']
        db.execute(
            """INSERT INTO entornos(nombre, sector) 
                VALUES (?, ?)""" ,
            (nombre, sector)
        )
        db.commit();
        ## TODO chequear errores
        return jsonify(entorno=url_for('entorno.detail', nombre=nombre))

        

@bp.route('/<string:nombre>/', methods=('GET', 'DELETE'))
def detail(nombre):
    db = get_db()

    if request.method == 'GET':
        entorno = db.execute(
    """SELECT e.id, e.nombre, s.nombre AS peine, s.piso FROM entornos e 
            JOIN sectores s ON s.id = e.sector WHERE e.nombre = ?""" ,
            (nombre,)
        ).fetchone()
        if entorno == None:
            abort(404, 'Entorno inexistente')
        return jsonify(entorno=entorno)
    elif request.method == 'DELETE':
        entorno = db.execute(
        """SELECT e.id FROM entornos e WHERE e.nombre = ?""" ,
            (nombre,)
        ).fetchone()
        if entorno == None:
            abort(404, 'Entorno inexistente')
        db.execute(
            """DELETE FROM entornos WHERE nombre = ?""" ,
            (nombre,)
        )
        db.commit()
        return jsonify(id=entorno['id'])
