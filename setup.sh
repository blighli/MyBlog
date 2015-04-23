#!/usr/bin/env bash

upgrade(){
    linpy/bin/pip install -r requirements.txt
    if [ -e migrations ];then
        linpy/bin/python manage.py db upgrade
    fi
}

cd "$(dirname "$0")"

if [ ! -e linpy ];then
    virtualenv linpy
    upgrade
fi

gitmsg="$(git pull)"

if [ "$gitmsg" != "Already up-to-date." ];then
    upgrade
fi

echo "$(date "+%Y-%m-%d %H:%M:%S")" >> history.log
echo "$gitmsg" >> history.log




