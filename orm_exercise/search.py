import os
import sqlalchemy as sq
from sqlalchemy.orm import sessionmaker
from main import create_tables, Publisher, Shop, Book, Stock, Sale

db_name = os.getenv('NETOLOGY_DB_NAME',"bookie")
db_user = os.getenv('NETOLOGY_DB_USER',"postgres")
db_pass = os.getenv('NETOLOGY_DB_PASSWORD',"postgres")
db_host = os.getenv('NETOLOGY_DB_HOST',"localhost")

conn_string = f"postgresql://{db_user}:{db_pass}@{db_host}/{db_name}"
engine = sq.create_engine(conn_string)

Session = sessionmaker(bind=engine)
session = Session()

create_tables(engine)

publisher_id = input("Please enter publisher id: ")

for p, sh, b, st, sa in session\
    .query(Publisher, Shop, Book, Stock, Sale)\
        .filter(Publisher.id == Book.id_publisher)\
            .filter(Book.id == Stock.id_book)\
                .filter(Stock.id == Sale.id_stock)\
                    .filter(Stock.id_shop == Shop.id)\
                        .filter(Publisher.id == publisher_id).all():
    print(f"{b.title} | {sh.name} | {sa.price} | {sa.date_sale}")
