from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from django.urls import reverse
from django.conf import settings
import csv


def index(request):
    return redirect(reverse('bus_stations'))


def bus_stations(request):
    with open(settings.BUS_STATION_CSV, encoding="utf8") as csvfile:
        reader = csv.DictReader(csvfile)
        bus_stations = []
        for row in reader:
            bus_stations.append({"Name": row["Name"], "Street": row["Street"], "District": row["District"]})
        
    paginator = Paginator(bus_stations, 10)
    current_page = request.GET.get('page', 1)
    page = paginator.get_page(current_page)

    context = {
        'bus_stations': page.object_list,
        'page': page,
    }
    return render(request, 'stations/index.html', context)
