from django.db import models
from .equipment import Equipment
from .users import User
import datetime


class InvestmentBase(models.Model):
    date = models.DateField("Date of the Investment",
                            blank=True,
                            default=datetime.date.today)

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

    user = models.ForeignKey(User,
                             on_delete=models.CASCADE,
                             blank=False)

    class Meta:
        abstract = True  # django wont create any table for this model
        ordering = ['date']


class ManualInvestment(InvestmentBase):
    target_amount = models.DecimalField("Amount bought from target equipment",
                                        max_digits=15,
                                        decimal_places=3,
                                        blank=False)


class OnlineInvestment(InvestmentBase):
    target_amount = models.DecimalField("Amount bought from target equipment",
                                        max_digits=15,
                                        decimal_places=3,
                                        blank=True)


class Asset(models.Model):
    user = models.ForeignKey(User,
                             on_delete=models.CASCADE,
                             blank=False)

    amount = models.DecimalField("Amount of asset",
                                 max_digits=16,
                                 decimal_places=3,
                                 blank=True,
                                 default=0
                                 )

    equipment = models.ForeignKey(Equipment,
                                  on_delete=models.CASCADE,
                                  blank=False,
                                  related_name='+')

    on_hold_for_investment = models.DecimalField("Amount of asset on hold for investment",
                                                 max_digits=16,
                                                 decimal_places=3,
                                                 blank=True,
                                                 default=0
                                                 )

    class Meta:
        unique_together = ('user', 'equipment')
