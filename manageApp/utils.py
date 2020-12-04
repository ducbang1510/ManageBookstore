import hashlib
from manageApp import db
from manageApp.models import *


def load_cate():
    return Category.query.all()


def load_author():
    return Author.query.all()


def get_author_of_book(book_id):
    authors = Author.query.join(BookAuthor, Author.id == BookAuthor.author_id)\
        .filter(BookAuthor.book_id == book_id)
    return authors.all()


def get_book_by_id(book_id):
    return Book.query.get(book_id)


def load_image(cat, book_id):
    image = Bookimage.query.join(Book, Book.id == Bookimage.book_id)\
        .filter(Bookimage.image.contains(cat), Bookimage.book_id == book_id)
    return image.all()


def load_books():
    books = db.session.query(Book.id, Book.name, Book.description, Book.image, Book.price, Author.name.label('author'))\
        .join(BookAuthor, BookAuthor.book_id == Book.id)\
        .join(Author, Author.id == BookAuthor.author_id)\

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


def add_invoice(cart):
    if cart:
        try:
            invoice = Invoice(customer_id=1)
            db.session.add(invoice)

            for p in list(cart.values()):
                detail = DetailInvoice(book_id=int(p["id"]),
                                       invoice_id=invoice.id,
                                       price=float(p["price"]),
                                       quantity=p["quantity"])
                db.session.add(detail)

            db.session.commit()

            return True
        except :
            pass

    return False