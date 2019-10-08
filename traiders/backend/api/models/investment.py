from django.db import models
from django.utils.timezone import now
from .equipment import Equipment
from .user import User


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
