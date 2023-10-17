from flask import (Blueprint, abort, jsonify, request, url_for)
from flaskr.db import get_db

bp = Blueprint('item', __name__, url_prefix='/api/items')


@bp.route('/', methods=('GET', 'POST'))
def index():
    db = get_db()
    if request.method == 'POST':
        item = request.json['item']
        nombre = item['nombre']
        res = db.execute(
            """INSERT INTO items(nombre) 
                VALUES (?)""",
            (nombre, )
        )
        id = res.lastrowid
        db.commit()
        return jsonify(item=url_for('item.detail', id=id))
    elif request.method == 'GET':
        items = db.execute(
            'SELECT id, nombre FROM items').fetchall()
        return jsonify(items=items)


@bp.route('/<int:id>', methods=('GET', 'PUT', 'DELETE'))
def detail(id):
    db = get_db()
    item = db.execute(
        'SELECT id, nombre FROM items WHERE id = ?', (id,)).fetchone()
    if item == None:
        abort(404,'No existe este item')
    if request.method == 'PUT':
        item = request.json['item']
        nombre = item['nombre']
        db.execute(
            'UPDATE items SET nombre = ? WHERE id = ?', (nombre, id))
        db.commit()
        return jsonify(item=url_for('item.detail', id=id))
    elif request.method == 'DELETE':
        db.execute(
            'DELETE FROM items WHERE id = ?', (id,)
        )
        db.commit()
        return jsonify(id=id)
    elif request.method == 'GET':
        return jsonify(item=item)

