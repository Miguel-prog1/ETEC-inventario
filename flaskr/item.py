from flask import (
    Blueprint, jsonify)

from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db


bp = Blueprint('item', __name__, url_prefix='/item')


@bp.route('/detalle/<int:id>')
def detail(id):
    db = get_db()
    item = db.execute(
        'SELECT id, nombre, ubicacion FROM items WHERE id = ?', (id,)).fetchone()


    return jsonify(item=item)
