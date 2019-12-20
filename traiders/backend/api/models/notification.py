from django.db import models
from .users import User


class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False, related_name='notifications')
    message = models.TextField(blank=False, max_length=200)
    reference_obj = models.TextField(blank=False, max_length=200)
    reference_url = models.URLField(blank=False)
    seen = models.BooleanField(default=False)