# coding=utf8
import os
from app import create_app, db
from flask.ext.script import Manager, Shell
from flask.ext.migrate import Migrate, MigrateCommand

app = create_app(os.getenv('FLASK_CONFIG') or 'default')
manager = Manager(app)
migrate = Migrate(app, db)

def make_shell_context():
    return dict(app=app, db=db)

manager.add_command('shell', Shell(make_shell_context))
manager.add_command('db', MigrateCommand)

@manager.command
def setup():
    from app.main.models import Post
    p1 = Post()
    p1.body = "Hello, World!"
    db.session.add(p1)
    db.session.commit()
    pass

if __name__ == '__main__':
    manager.run()