from sqlalchemy import create_engine
import os, uuid
postgres_url = os.getenv('DATABASE_URL', 'postgresql://postgres:postgres@localhost:5432/blog_tutorial')
engine = create_engine(postgres_url, convert_unicode=True)

def get_posts(id=None):
    try:
        if(id):
            data = engine.execute('SELECT * FROM tbl_post WHERE id=%s', id).fetchone()
        else:
            data = engine.execute('SELECT * FROM tbl_post').fetchall()
        if(data):
            if(isinstance(data, list)):
                data = [dict(row.items()) for row in data]
            else:
                data = dict(data.items())
        return data
    except Exception as e:
        print(e)

if __name__=='__main__':
    print(uuid.uuid4())
