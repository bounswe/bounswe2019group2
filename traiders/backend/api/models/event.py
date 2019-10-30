from django.db import models
from django.utils.timezone import now
from django_countries.fields import CountryField


class Event(models.Model):
    date = models.DateTimeField(blank=True, default=now)
    country = CountryField()
    calendarId = models.CharField(max_length=6, unique=True)
    category = models.CharField(max_length=64, blank=False)
    actual = models.CharField(max_length=16, blank=False)
    previous = models.CharField(max_length=16, blank=False)
    forecast = models.CharField(max_length=16, blank=True, null=True)
    sourceURL = models.URLField(blank=False)
    importance = models.IntegerField(blank=False, choices=[(i, i) for i in range(1, 4)])
