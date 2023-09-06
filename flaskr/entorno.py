from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('entorno', __name__)

@bp.route('/')
def index():
    db = get_db()
    entornos = db.execute(
        'SELECT id, nombre, peine,piso FROM entornos ORDER BY peine, piso, nombre'
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
    return render_template('entorno/index.html', peines=peines)

@bp.route('/<string:nombre>/update')
def update(nombre): 
    return nombre