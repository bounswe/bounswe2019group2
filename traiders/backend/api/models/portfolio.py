from django.db import models
from .users import User
from .parity import Parity


class Portfolio(models.Model):
    name = models.CharField(max_length=64, blank=False)
    owner = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    followed_by = models.ManyToManyField(User, related_name='followed_by', blank=True)
    parities = models.ManyToManyField(Parity, related_name='parities', blank=True)