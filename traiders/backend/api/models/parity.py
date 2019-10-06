from django.db import models
from django.utils.timezone import now
from .equipment import Equipment


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
