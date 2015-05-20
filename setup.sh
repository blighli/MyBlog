#!/usr/bin/env bash

cd "$(dirname "$0")"

if [ "$1" == "clean" ]; then
    rm -rf venv
    rm requirements.bak
    rm *.sqlite
fi

git pull

if [ ! -e venv ];then
    virtualenv venv
fi

if [[ ! -e requirements.bak || requirements.txt -nt requirements.bak ]];then
    cp requirements.txt requirements.bak
    venv/bin/pip install -r requirements.txt
fi

if [ -e migrations ];then
    venv/bin/python manage.py db upgrade
fi



