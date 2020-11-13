from sqlalchemy import Column, Integer, Float, String, ForeignKey, Boolean, Date, Enum
from sqlalchemy.orm import relationship
from flask_login import UserMixin
from datetime import datetime
from enum import Enum as UserEnum
from manageApp import db


class SaleBase(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)

    def __str__(self):
        return self.name


#Bảng thể loại
class Category(SaleBase):
    __tablename__ = 'category'

    books = relationship('Book', secondary='bookcate')


#Bảng sách
class Book(SaleBase):
    __tablename__ = 'book'

    description = Column(String(255))
    image = Column(String(255))
    price = Column(Float, default=0)
    categories = relationship('Category', secondary='bookcate')
    authors = relationship('Author', secondary='bookauthor')
    invenReports = relationship('InventoryReport', secondary='detailInventoryReport')


#Bảng tác giả
class Author(SaleBase):
    __tablename__ = 'author'

    books = relationship('Book', secondary='bookauthor')


#Bảng báo cáo tồn
class InventoryReport(db.Model):
    __tablename__ = 'inventoryReport'

    id = Column(Integer, primary_key=True, autoincrement=True)
    report_date = Column(Date, default=datetime.now())
    books = relationship('Book', secondary='detailInventoryReport')


#Bảng sách-thể loại
class BookCate(db.Model):
    __tablename__ = 'bookcate'

    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    category_id = Column(Integer, ForeignKey('category.id'), primary_key=True)


#Bảng sách-tác giả
class BookAuthor(db.Model):
    __tablename__ = 'bookauthor'

    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    author_id = Column(Integer, ForeignKey('author.id'), primary_key=True)


#Bảng chi tiết báo cáo tồn
class DetailInventoryReport(db.Model):
    __tablename__ = 'detailInventoryReport'

    report_id = Column(Integer, ForeignKey('inventoryReport.id'), primary_key=True)
    book_id = Column(Integer, ForeignKey('book.id'), primary_key=True)
    quantity_at_first = Column(Integer, default=0)
    quantity_at_the_end = Column(Integer, default=0)
    arise = Column(String(255))


class UserRole(UserEnum):
    USER = 1
    ADMIN = 2


#Bảng user
class User(SaleBase, UserMixin):
    __tablename__ = 'user'

    email = Column(String(50), nullable=True)
    username = Column(String(100), nullable=False)
    password = Column(String(100), nullable=False)
    avatar = Column(String(100))
    active = Column(Boolean, default=True)
    joined_date = Column(Date, default=datetime.now())
    user_role = Column(Enum(UserRole), default=UserRole.USER)


if __name__ == '__main__':
    db.create_all()