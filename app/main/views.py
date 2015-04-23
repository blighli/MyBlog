# coding=utf8
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
