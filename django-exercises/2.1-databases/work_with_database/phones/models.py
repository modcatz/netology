from django.db import models


class Phone(models.Model):
    id = models.BigIntegerField(primary_key=True, unique=True)
    name = models.CharField()
    price = models.DecimalField(max_digits=20, decimal_places=2)
    image = models.CharField()
    release_date = models.DateField()
    lte_exists = models.BooleanField()
    slug = models.CharField()
    
