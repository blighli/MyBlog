# coding=utf8
from flask import render_template, url_for, redirect, request
from . import  main
from .. import db

@main.route('/')
def index():
    return render_template("index.html")


@main.route('/login')
def login():
    return render_template("login.html")
