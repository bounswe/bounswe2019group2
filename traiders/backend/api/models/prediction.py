from django.db import models
import datetime

from . import Equipment, User


class Prediction(models.Model):
    SUCCESSFUL = 1
    PENDING = -1
    FAILED = 0
    RESULT_CHOICES = (
        (SUCCESSFUL, 'Successful'),
        (FAILED, 'Failed'),
        (PENDING, 'In Progress'),
    )
    WILL_INCREASE = 1
    WILL_DECREASE = -1
    DIRECTION_CHOICES = (
        (WILL_INCREASE, 'Will Increase'),
        (WILL_DECREASE, 'Will Decrease'),
    )

    by_user = models.ForeignKey(User,
                                on_delete=models.CASCADE,
                                blank=False,
                                related_name='+')

    date = models.DateField("Date of prediction",
                            blank=True,
                            default=datetime.date.today)

    base_equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE,
                                       blank=False, related_name='+')

    target_equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE,
                                         blank=False, related_name='+')

    direction = models.IntegerField(choices=DIRECTION_CHOICES, blank=False)

    result = models.IntegerField(choices=RESULT_CHOICES, default=PENDING)

    class Meta:
        unique_together = ('date', 'by_user', 'base_equipment', 'target_equipment')
