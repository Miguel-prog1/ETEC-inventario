from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('entornos', __name__)

@bp.route('/')
def index():
    db = get_db()
    entornos= db.execute(
        'SELECT id, nombre, peine FROM entornos ORDER BY nombre'
    ).fetchall()
    return render_template('entorno/index.html', entornos=entornos)