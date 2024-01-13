from django.shortcuts import render, redirect
from books.models import Book
from datetime import datetime
from books.converters import DateConverter

def index(request):
    return redirect('books')

def books_view(request):
    template = 'books/books_list.html'
    books = Book.objects.all().values()
    context = {
        'books': books
    }
    return render(request, template, context)

def book_view(request,pub_date):
    template = 'books/date_view.html'
    dates = list(Book.objects.all().order_by('pub_date').values_list("pub_date",flat=True).distinct("pub_date"))
    dates = [DateConverter().to_url(x) for x in dates]
    page = dates.index(pub_date)
    previous_date = None
    if page > 0:
        previous_date = dates[page-1]
    next_date = None
    if page < len(dates)-1:
        next_date = dates[page+1]
    
    
    books = Book.objects.filter(pub_date=pub_date)
    context = {
        'books': books,
        'previous_date': previous_date,
        'next_date': next_date
    }
    return render(request, template, context)