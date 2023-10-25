import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from sqlalchemy.sql import func
import os
import json

Base = declarative_base()

os.environ['NETOLOGY_DB_NAME'] = "bookie"
os.environ['NETOLOGY_DB_USER'] = "postgres"
os.environ['NETOLOGY_DB_PASSWORD'] = "postgres"

db_name = os.getenv('NETOLOGY_DB_NAME')
db_user = os.getenv('NETOLOGY_DB_USER')
db_pass = os.getenv('NETOLOGY_DB_PASSWORD')

conn_string = f"postgresql://{db_user}:{db_pass}@localhost/{db_name}"
engine = sq.create_engine(conn_string)

Session = sessionmaker(bind=engine)
session = Session()

class Publisher(Base):
    __tablename__ = "publisher"
    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=50), unique=True, nullable=False)

    books = relationship("Book", back_populates="publisher")

class Book(Base):
    __tablename__ = "book"
    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.String(length=40), nullable=False)
    id_publisher = sq.Column(sq.Integer, sq.ForeignKey("publisher.id"), nullable=False)

    publisher = relationship("Publisher", back_populates="books")
    stock_book = relationship("Stock", back_populates="book_stock")

class Shop(Base):
    __tablename__ = "shop"
    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=50), unique=True, nullable=False)

    stock_shop = relationship("Stock", back_populates = "shop_stock")

class Stock(Base):
    __tablename__ = "stock"
    id = sq.Column(sq.Integer, primary_key=True)
    id_book = sq.Column(sq.Integer, sq.ForeignKey("book.id"), nullable=False)
    id_shop = sq.Column(sq.Integer, sq.ForeignKey("shop.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

    book_stock = relationship("Book", back_populates = "stock_book")
    shop_stock = relationship("Shop", back_populates = "stock_shop")
    sale_stock = relationship("Sale", back_populates = "stock_sale")


class Sale(Base):
    __tablename__ = "sale"
    id = sq.Column(sq.Integer, primary_key=True)
    price = sq.Column(sq.Numeric(10, 2), nullable=True)
    date_sale = sq.Column(sq.DateTime(timezone=True), default=func.now())
    id_stock = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)
    count = sq.Column(sq.Integer)

    stock_sale = relationship("Stock", back_populates = "sale_stock")


def create_tables(engine):
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
    with open('test_data.json', 'r') as fill:
        data = json.load(fill)
    for record in data:
        model = {
            'publisher': Publisher,
            'shop': Shop,
            'book': Book,
            'stock': Stock,
            'sale': Sale,
        }[record.get('model')]
        session.add(model(id=record.get('pk'), **record.get('fields')))
    session.commit()

create_tables(engine)


