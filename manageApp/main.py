from flask import render_template, redirect, request
from flask_login import login_user, login_required
from sqlalchemy import func
from sqlalchemy.exc import IntegrityError
from pymysql.err import IntegrityError
from manageApp import app, login, db
from manageApp.models import *
from manageApp.admins import *
import hashlib


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/login-admin", methods=["post", "get"])
def login_admin():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password", "")
        password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        user = User.query.filter(User.username == username.strip(), User.password == password).first()

        if user:
            login_user(user=user)

    return redirect("/admin")


@app.route("/register-form", methods=["post", "get"])
def register_form():
    return render_template("admin/register.html")


def load_data_user():
    users = User.query.all()
    return users


def check_username(username):
    users = load_data_user()
    for u in users:
        if u.username == username:
            return False
    return True


@app.route("/register", methods=["post", "get"])
def register():
    if request.method == "POST":
        name_dk = request.form.get("name_dk")
        email_dk = request.form.get("email_dk")
        username_dk = request.form.get("username_dk")
        password_dk = request.form.get("password_dk", "")
        password_dk = str(hashlib.md5(password_dk.strip().encode("utf-8")).hexdigest())

        if (check_username(username_dk) == True):
            user = User(name=name_dk, email=email_dk, username=username_dk, password=password_dk)
            db.session.add(user)
            db.session.commit()
            return redirect("/admin")
    return redirect("register-form")


@login.user_loader
def load_user(user_id):
    return User.query.get(user_id)


if __name__ == "__main__":
    app.run(debug=True)
