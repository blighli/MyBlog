activate_this = '/var/www/blog/venv/bin/activate_this.py'
execfile(activate_this, dict(__file__=activate_this))
import sys
sys.path.insert(0, '/var/www/blog')
from manage import app as application