#!/usr/bin/env bash

cd "$(dirname "$0")"

git pull

if [ ! -e linpy ];then
    virtualenv linpy
fi

if [[ ! -e requirements.bak || requirements.txt -nt requirements.bak ]];then
    cp requirements.txt requirements.bak
    linpy/bin/pip install -r requirements.txt
fi

if [ -e migrations ];then
    linpy/bin/python manage.py db upgrade
fi



