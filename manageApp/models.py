from sqlalchemy import Column, Integer, Float, String, ForeignKey, Boolean, Date, Enum
from sqlalchemy.orm import relationship
from flask_login import UserMixin, current_user, logout_user
from datetime import datetime
from enum import Enum as UserEnum
from manageApp import db, admin


class SaleBase(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)

    def __str__(self):
        return self.name


# class Category(SaleBase):
#     __tablename__ = 'category'
#
#     products = relationship('Product',
#                             backref='category',
#                             lazy=True)
#
#
# class Product(SaleBase):
#     __tablename__ = 'product'
#
#     description = Column(String(255))
#     image = Column(String(255))
#     price = Column(Float, default=0)
#     category_id = Column(Integer,
#                          ForeignKey(Category.id),
#                          nullable=False)


class UserRole(UserEnum):
    USER = 1
    ADMIN = 2


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