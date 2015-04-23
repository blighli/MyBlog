@echo off
if not exist winpy (
    virtualenv winpy
)

winpy\Scripts\pip install -r requirements.txt

if exist migrations (
    winpy\Scripts\python manage.py db upgrade
)