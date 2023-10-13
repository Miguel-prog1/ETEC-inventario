from flask import (Blueprint, jsonify)
from flaskr.db import get_db

bp = Blueprint('item', __name__, url_prefix='/api/item')

@bp.route('/detalle/<int:id>')
def detail(id):
    db = get_db()
    item = db.execute(
        'SELECT id, nombre FROM items WHERE id = ?', (id,)).fetchone()
    return jsonify(item=item)
