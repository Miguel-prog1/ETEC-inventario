from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db


bp = Blueprint('item', __name__, url_prefix='/item')


@bp.route('/<int:id>/detalle/')
def detail(id):
    db = get_db()
    item = db.execute(
        'SELECT id, nombre, ubicacion FROM items WHERE id = ?', (id,)).fetchone()


    return render_template('item/detail.html', item=item)
