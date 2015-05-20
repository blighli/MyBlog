import os
import sys

basedir = os.path.abspath(os.path.dirname(__file__))

activate_this = os.path.join(basedir, + 'venv/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

sys.path.insert(0, basedir)
from manage import app as application