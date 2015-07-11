#!/usr/bin/env bash

venv="venv"
venv_bin="$venv/bin"
if [ "$(uname -s)" == "MINGW32_NT-6.1" ]; then
	venv_bin="$venv/Scripts"
fi

cd "$(dirname "$0")"

if [ "$1" == "clean" ]; then
    rm -rf "$venv"
    rm requirements.bak
    rm *.sqlite
    exit
fi

if [ "$1" == "run" ]; then
    "$venv_bin"/python manage.py runserver &
    gulp watch
    exit
fi

git pull

if [ ! -e "$venv" ];then
    virtualenv "$venv"
fi

if [[ ! -e requirements.bak || requirements.txt -nt requirements.bak ]];then
    cp requirements.txt requirements.bak
    "$venv_bin"/pip install -r requirements.txt
fi

if [ -e migrations ];then
    "$venv_bin"/python manage.py db upgrade
fi