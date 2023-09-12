from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db


bp = Blueprint('item', __name__, url_prefix='/item')


@bp.route('/<number:id>/detail/')
def item_details(id):
    db = get_db()
    item = db.execute(
        'SELECT id, proveniencia, entorno , caracteristica_de_movilidad_de_armario, tipo_armario, descripcion, nombre FROM entornos ORDER BY id'
    ).fetchall()
    if item is None:
        abort(404, "No existe el item de id: {0}".format(id))


    return render_template('item/detail.html', items=item)
