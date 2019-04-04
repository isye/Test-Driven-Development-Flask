import pytest, os
from sqlalchemy import create_engine

@pytest.mark.parametrize('path', (
    '/blog-tutorial',
))
def test_blog_index(app, path):
    client = app.test_client()
    assert (client.get(path).status_code==200)

@pytest.mark.parametrize('path', (
    '/post/<string:title>',
))
def test_blog_post(app, path):
    client = app.test_client()
    assert (client.get(path).status_code==200)

def test_db():
    postgres_url =  'postgresql://postgres:postgres@localhost:5432/blog_tutorial'
    engine = create_engine(postgres_url, convert_unicode=True)
    connection = engine.execute('SELECT 1')
    assert (connection)
    connection = engine.execute('SELECT * FROM tbl_author')
    assert (connection)
    connection = engine.execute('SELECT * FROM tbl_post')
    assert (connection)


