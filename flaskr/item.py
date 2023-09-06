from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db


bp = Blueprint('item', __name__)


@bp.route('/<string:nombre>/update')
def index():
    db = get_db()
    items = db.execute(
        'SELECT id, proveniencia, entorno , caracteristica_de_movilidad_de_armario, tipo_armario FROM entornos ORDER BY nombre'
    ).fetchall()

    return render_template('item/index.html', items=items)
