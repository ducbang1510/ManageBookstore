from sqlalchemy import Column, Integer, Float, String, ForeignKey, Boolean, Date, Enum
from sqlalchemy.orm import relationship, backref
from flask_login import UserMixin
from datetime import datetime
from enum import Enum as UserEnum
from manageApp import db


class SaleBase(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)

    def __str__(self):
        return self.name


#Bảng khách hàng
class Customer(SaleBase):
    __tablename__ = 'customer'

    name = Column(String(50), nullable=False)
    address = Column(String(255))
    phone = Column(String(20), nullable=True)
    email = Column(String(50), nullable=True)
    debt = Column(Float, default=0)
    deptReports = relationship('DeptReport', secondary='detail_dept_report')


#Bảng sách
class Book(SaleBase):
    __tablename__ = 'book'

    name = Column(String(50), nullable=False)
    description = Column(String(255))
    image = Column(String(255))
    price = Column(Float, default=0)
    categories = relationship('Category', secondary='book_cate', lazy='subquery', backref=backref('books', lazy=True))
    authors = relationship('Author', secondary='book_author', lazy='subquery', backref=backref('books', lazy=True))
    # images = relationship('Bookimage', backref('book'), lazy=True)


class Bookimage(SaleBase):
    __tablename__ = 'book_image'

    image = Column(String(255), nullable=False)
    book_id = Column(Integer, ForeignKey(Book.id), nullable=False)


#Bảng thể loại
class Category(SaleBase):
    __tablename__ = 'category'

    name = Column(String(50), nullable=False)


#Bảng tác giả
class Author(SaleBase):
    __tablename__ = 'author'

    name = Column(String(50), nullable=False)


#Bảng hóa đơn
class Invoice(SaleBase):
    __tablename__ = 'invoice'

    date_of_invoice = Column(Date, default=datetime.now())
    total = Column(Float, default=0)
    paid = Column(Float, default=0)
    customer_id = Column(Integer, ForeignKey('customer.id'))
    user_id = Column(Integer, ForeignKey('user.id'))
    books = relationship('Book', secondary='detail_invoice')


#Bảng phiếu thu tiền
class DebtCollectionNote(SaleBase):
    __tablename__ = 'debt_collection_note'

    customer_id = Column(Integer, ForeignKey('customer.id'))
    user_id = Column(Integer, ForeignKey('user.id'))
    collection_date = Column(Date, default=datetime.now())
    proceeds = Column(Float, default=0)


#Bảng phiếu nhập sách
class ReceivedNote(SaleBase):
    __tablename__ = 'received_note'

    date_received = Column(Date, default=datetime.now())
    user_id = Column(Integer, ForeignKey('user.id'))
    books = relationship('Book', secondary='detail_received_note')


#Bảng báo cáo tồn
class InventoryReport(SaleBase):
    __tablename__ = 'inventory_report'

    report_date = Column(Date, default=datetime.now())
    books = relationship('Book', secondary='detail_inventory_report')


#Bảng báo cáo công nợ
class DeptReport(SaleBase):
    __tablename__ = 'dept_report'

    report_date = Column(Date, default=datetime.now())


#Bảng sách-thể loại
class BookCate(db.Model):
    __tablename__ = 'book_cate'

    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    category_id = Column(Integer, ForeignKey('category.id'), primary_key=True)


#Bảng sách-tác giả
class BookAuthor(db.Model):
    __tablename__ = 'book_author'

    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    author_id = Column(Integer, ForeignKey('author.id'), primary_key=True)


#Bảng chi tiết hóa đơn
class DetailInvoice(db.Model):
    __tablename__ = 'detail_invoice'

    invoice_id = Column(Integer, ForeignKey('invoice.id'), primary_key=True)
    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    quantity = Column(Integer, default=0)
    price = Column(Float, default=0)


#Bảng chi tiết phiếu nhập sách
class DetailReceivedNote(db.Model):
    __tablename__ = 'detail_received_note'

    note_id = Column(Integer, ForeignKey('received_note.id'), primary_key=True)
    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    quantity = Column(Integer, default=0)


#Bảng chi tiết báo cáo tồn
class DetailInventoryReport(db.Model):
    __tablename__ = 'detail_inventory_report'

    report_id = Column(Integer, ForeignKey('inventory_report.id'), primary_key=True)
    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    quantity_before = Column(Integer, default=0)
    quantity_after = Column(Integer, default=0)
    arise = Column(String(255))


#Bảng chi tiết báo cáo công nợ
class DetailDeptReport(db.Model):
    __tablename__ = 'detail_dept_report'

    report_id = Column(Integer, ForeignKey('dept_report.id'), primary_key=True)
    customer_id = Column(Integer, ForeignKey('customer.id'), primary_key=True)
    money_before = Column(Float, default=0)
    money_after = Column(Float, default=0)
    arise = Column(String(255))


class UserRole(UserEnum):
    USER = 1
    ADMIN = 2
    MANAGER = 3


#Bảng user
class User(SaleBase, UserMixin):
    __tablename__ = 'user'

    name = Column(String(50), nullable=False)
    email = Column(String(50), nullable=True)
    username = Column(String(100), nullable=False, unique=True)
    password = Column(String(100), nullable=False)
    avatar = Column(String(100))
    active = Column(Boolean, default=True)
    joined_date = Column(Date, default=datetime.now())
    user_role = Column(Enum(UserRole), default=UserRole.USER)


if __name__ == '__main__':
    db.create_all()