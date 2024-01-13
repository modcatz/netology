import csv

from django.core.management.base import BaseCommand
from phones.models import Phone


class Command(BaseCommand):
    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):
        with open('phones.csv', 'r') as file:
            phones = list(csv.DictReader(file, delimiter=';'))

        for phone in phones:
            row = Phone()
            row.id = phone["id"]
            row.name = phone["name"]
            row.image = phone["image"]
            row.price = phone["price"]
            row.release_date = phone["release_date"]
            row.lte_exists = phone["lte_exists"]
            row.slug = phone["name"].replace(" ", "-").lower()
            row.save()
