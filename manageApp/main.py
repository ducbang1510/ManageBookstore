from flask import render_template, redirect, request, session, jsonify
from flask_login import login_user
from manageApp import app, login, utils
from manageApp.models import *
from manageApp.admins import *
import hashlib, os


@app.route("/")
def index():
    return render_template('home/index.html')


@app.route("/shop-list/<int:page_num>")
def shop_list(page_num):
    categories = utils.load_cate()
    author_list = utils.load_author()
    book_list = utils.load_books()
    books = Book.query.paginate(per_page=12, page=page_num, error_out=True)
    all_pages = books.iter_pages()

    return render_template('shop_list.html', books=books, book_list=book_list,
                           categories=categories,
                           author_list=author_list,
                           all_pages=all_pages)


@app.route("/shop-list/book-detail/<int:book_id>")
def book_detail(book_id):
    book = utils.get_book_by_id(book_id=book_id)
    authors = utils.get_author_of_book(book.id)
    images = utils.load_image('300x452', book_id=book_id)

    return render_template('book_detail.html', book=book, authors=authors, images=images)


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


@app.route("/register", methods=["post", "get"])
def register():
    err_msg = ''
    if request.method == 'POST':
        name = request.form.get('name_dk')
        email = request.form.get('email_dk')
        username = request.form.get('username_dk')
        password = request.form.get('password_dk', '').strip()
        confirm_password = request.form.get('password-repeat', '').strip()

        if password == confirm_password:
            avatar = request.files["avatar"]
            avatar_path = 'images/upload/%s' % avatar.filename
            avatar.save(os.path.join(app.config['ROOT_PROJECT_PATH'],
                                     'static/', avatar_path))

            if utils.add_user(name=name, email=email, username=username,
                              password=password, avatar=avatar_path):
                return redirect('/admin')
        else:
            err_msg = "Mật khẩu KHÔNG khớp!"

    return render_template('admin/register.html', err_msg=err_msg)


@login.user_loader
def load_user(user_id):
    return User.query.get(user_id)


@app.route('/api/cart', methods=['get', 'post'])
def add_to_cart():
    if 'cart' not in session:
        session['cart'] = {}

    cart = session['cart']

    data = request.json
    id = str(data.get('id'))
    name = data.get('name')
    price = data.get('price')

    if id in cart: #co san pham trong gio
        cart[id]['quantity'] = cart[id]['quantity'] + 1
    else: #chua co san pham trong gio
        cart[id] = {
            "id": id,
            "name": name,
            "price": price,
            "quantity": 1
        }

    session['cart'] = cart

    total_quan, total_amount = utils.cart_stats(cart)

    return jsonify({
        "total_amount": total_amount,
        "total_quantity": total_quan
    })


@app.route("/shop-cart")
def shop_cart():
    return render_template('shop_cart.html')


@app.route('/payment', methods=['get', 'post'])
def payment():
    if request.method == 'POST':
        if utils.add_invoice(session.get('cart')):
            del session['cart']

            return jsonify({"message": "Payment added!!!"})

    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    return render_template('payment.html', cart_info=cart_info)


if __name__ == "__main__":
    app.run(debug=True)
