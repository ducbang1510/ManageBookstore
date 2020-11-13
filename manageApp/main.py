from flask import render_template, redirect, request
from flask_login import login_user, login_required
from manageApp import app, login
from manageApp.models import *
from manageApp.admins import *
import hashlib


@app.route("/")
def index():
    return render_template('home_index.html')


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


@app.route("/register")
def register():
    return render_template("admin/register.html")


@login.user_loader
def load_user(user_id):
    return User.query.get(user_id)


if __name__ == "__main__":
    app.run(debug=True)