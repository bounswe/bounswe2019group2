from django.db import models

from . import Equipment


class ParitySetting(models.Model):
    base_equipment = models.ForeignKey(Equipment,
                                       on_delete=models.CASCADE,
                                       blank=False,
                                       related_name='+')

    target_equipment = models.ForeignKey(Equipment,
                                         on_delete=models.CASCADE,
                                         blank=False,
                                         related_name='+')

    update_rate = models.DurationField(blank=False, help_text='hh:mm:ss')
    from_date = models.DateTimeField(blank=False)
    last_updated = models.DateTimeField(null=True, blank=True)  # null/blank means not updated yet

    def __str__(self):
        return "/".join([self.base_equipment.symbol, self.target_equipment.symbol])
