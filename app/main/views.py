# coding=utf8
import os
from flask import render_template, url_for, redirect, request
from . import  main
from .. import db
from .models import Post

@main.route('/')
def index():
    posts = Post.query.all()
    return render_template("index.html", posts=posts)


@main.route('/login')
def login():
    return render_template("login.html")

@main.route('/status')
def status():
    return os.getenv('FLASK_CONFIG')
