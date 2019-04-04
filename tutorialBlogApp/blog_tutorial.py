from flask import (
    Blueprint, render_template
)
from tutorialBlogApp import postgres_blog_tutorial as pg
bp = Blueprint('blogTutorial', __name__)

@bp.route('/blog-tutorial', methods=['GET'])
def blog_tutorial():
    data = pg.get_posts()
    return render_template('blog_tutorial.html', data=data)

@bp.route('/post/<string:id>', methods=['GET'])
def post(id):
    data = pg.get_posts(id)
    return render_template('post.html', data=data)
