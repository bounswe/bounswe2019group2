from django.db import models
from .users import User


class Alert(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False, related_name='alerts')
    target_symbol = models.CharField("Equipment Symbol", max_length=32, blank=False)
    base_symbol = models.CharField("Equipment Symbol", max_length=32, blank=False)
    ratio = models.DecimalField(max_digits=16, decimal_places=4, blank=False)
    increasing = models.BooleanField(default=True)
