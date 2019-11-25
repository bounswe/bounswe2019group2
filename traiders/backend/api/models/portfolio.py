from django.db import models
from .users import User
from .equipment import Equipment


class EquipmentPair(models.Model):
    base_equipment = models.ForeignKey(Equipment, blank=True)
    target_equipment = models.ForeignKey(Equipment, blank=True)


class Portfolio(models.Model):
    name = models.CharField(max_length=64, blank=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    followed_by = models.ManyToManyField(User, blank=True)
    parities = models.ManyToManyField(EquipmentPair, blank=True)
