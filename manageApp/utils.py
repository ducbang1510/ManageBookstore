import hashlib
from manageApp import db
from manageApp.models import *


def load_cate():
    return Category.query.all()


def load_author():
    return Author.query.all()


def load_books():
    books = Book.query
    return books.all()


def add_user(name, email, username, password, avatar):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    u = User(name=name,
             email=email,
             username=username,
             password=password,
             avatar=avatar)
    try:
        db.session.add(u)
        db.session.commit()

        return True
    except Exception as ex:
        print(ex)
        return False


def cart_stats(cart):
    count, price = 0, 0
    for p in cart.values():
        count = count + p["quantity"]
        price = price + p["quantity"] * p["price"]

    return count, price