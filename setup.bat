@echo off
if not exist venv (
    virtualenv venv
    venv\Scripts\pip install -r requirements.txt
    if exist migrations (
        venv\Scripts\python manage.py db upgrade
        venv\Scripts\python manage.py setup
    )
)