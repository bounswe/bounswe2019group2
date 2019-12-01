from django.db import models
import datetime

from . import Equipment, User


class OrderBase(models.Model):
    user = models.ForeignKey(User,
                             on_delete=models.CASCADE,
                             blank=False,
                             related_name='+')

    date = models.DateTimeField("Time of the given order",
                                blank=True,
                                default=datetime.datetime.now)

    base_equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE,
                                       blank=False, related_name='+')

    target_equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE,
                                         blank=False, related_name='+')

    class Meta:
        abstract = True


class BuyOrder(OrderBase):

    buy_ratio = models.DecimalField(max_digits=16, decimal_places=4, blank=False)
    buy_amount = models.DecimalField(max_digits=15, decimal_places=3, blank=False)


class StopLossOrder(OrderBase):
    sell_ratio = models.DecimalField(max_digits=16, decimal_places=4, blank=False)
    sell_amount = models.DecimalField(max_digits=15, decimal_places=3, blank=False)
