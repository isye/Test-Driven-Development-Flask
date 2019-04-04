from flask import Flask
from tutorialBlogApp import blog_tutorial

def create_app(config_file = None):
    app = Flask(__name__, instance_relative_config=True)

    app.register_blueprint(blog_tutorial.bp)
    app.add_url_rule('/blog_tutorial', endpoint='blog_tutorial')
    app.add_url_rule('/post/<string:id>', endpoint='post')

    return app