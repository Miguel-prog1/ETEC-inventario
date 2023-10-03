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
    # voy a armar un diccionario que tenga como claves los peines de la escuela
    # los valores de cada uno serán un diccionario que tiene como clave los pisos
    # y como valores una lista de los entornos formativos de cada piso
    peines = {}
    for e in entornos:
        peine = e["peine"]
        piso = e["piso"]
        if peine not in peines:
            peines[peine] = {}
        pisosDelPeine = peines[peine]
        if piso not in pisosDelPeine:
            pisosDelPeine[piso] = []
        listaDeEntornos = pisosDelPeine[piso]
        listaDeEntornos.append(e)        
    print(peines)
    return jsonify(peines=peines)

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