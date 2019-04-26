from django.db import models
from django.contrib.auth.models import User
from django.utils.timezone import now


class Equipment(models.Model):
    name = models.CharField("Equipment Name",
                            max_length=16,
                            blank=False)

    category = models.CharField("Equipment Category",
                                max_length=8,
                                blank=False)

    symbol = models.CharField("Equipment Symbol",
                              max_length=3,
                              blank=False,
                              unique=True)

    def __str__(self):
        return self.symbol


class ManualInvestment(models.Model):
    date = models.DateField("Date of the Investment",
                            blank=True,
                            default=now)

    base_equipment = models.ForeignKey(Equipment,
                                       on_delete=models.CASCADE,
                                       blank=False,
                                       related_name='+')

    target_equipment = models.ForeignKey(Equipment,
                                         on_delete=models.CASCADE,
                                         blank=False,
                                         related_name='+')

    base_amount = models.DecimalField("Amount sold from base equipment",
                                      max_digits=15,
                                      decimal_places=3,
                                      blank=False)

    target_amount = models.DecimalField("Amount bought from target equipment",
                                        max_digits=15,
                                        decimal_places=3,
                                        blank=False)

    made_by = models.ForeignKey(User,
                                on_delete=models.CASCADE,
                                blank=False)

    def __str__(self):
        return "/".join([self.made_by.username, str(self.date), self.base_equipment.symbol, self.target_equipment.symbol])


class Parity(models.Model):
    base_equipment = models.ForeignKey(Equipment,
                                       on_delete=models.CASCADE,
                                       blank=False,
                                       related_name='+')

    target_equipment = models.ForeignKey(Equipment,
                                         on_delete=models.CASCADE,
                                         blank=False,
                                         related_name='+')

    ratio = models.DecimalField("Ratio of target equipment to base equipment",
                                max_digits=8,
                                decimal_places=4,
                                blank=False)

    date = models.DateTimeField("Date of the observed Parity",
                                blank=True,
                                default=now)

    def __str__(self):
        return "/".join([self.base_equipment.symbol, self.target_equipment.symbol, str(self.date)])
