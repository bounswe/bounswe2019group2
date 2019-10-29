from django.db import models
from django.utils.timezone import now


class Event(models.Model):
    date = models.DateTimeField(blank=True, default=now)
    country = models.CharField(max_length=64, blank=False)
    calendarId = models.CharField(max_length=6, unique=True)
    category = models.CharField(max_length=64, blank=False)
    actual = models.CharField(max_length=16, blank=False)
    previous = models.CharField(max_length=16, blank=False)
    forecast = models.CharField(max_length=16, blank=True, null=True)
    sourceURL = models.URLField(blank=False)
    importance = models.IntegerField(blank=False)

