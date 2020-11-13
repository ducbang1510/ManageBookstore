from manageApp import admin, db
from flask import redirect
from flask_admin.contrib.sqla import ModelView
from flask_admin import BaseView, expose
from flask_login import current_user, logout_user
from manageApp.models import Category, Book


class AuthenticatedView(ModelView):
    def is_accessible(self):
        return current_user.is_authenticated


class CategoryModelView(AuthenticatedView):
    column_display_pk = False
    can_create = True
    can_export = True
    can_delete = False


class BookModelView(AuthenticatedView):
    column_display_pk = False
    can_create = True
    can_export = True
    can_delete = False


class ContactView(BaseView):
    @expose('/')
    def index(self):
        return self.render('admin/contact.html')


class LogOutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()
        return redirect('/admin')

    def is_accessible(self):
        return current_user.is_authenticated


admin.add_view(CategoryModelView(Category, db.session))
admin.add_view(BookModelView(Book, db.session))
admin.add_view(ContactView(name='Liên hệ'))
admin.add_view(LogOutView(name="Đăng xuất"))