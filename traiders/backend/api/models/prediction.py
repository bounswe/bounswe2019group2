from django.db import models
from django.utils.timezone import now
from .equipment import Equipment
from .users import User


class Prediction(models.Model):
    SUCCESSFUL = 1
    PENDING = 0
    FAILED = -1
    RESULT_CHOICES = (
        (SUCCESSFUL, 'Successful'),
        (FAILED, 'Failed'),
        (PENDING, 'In Progress'),
    )
    INCREASE = 1
    DECREASE = 0
    DIRECTION_CHOICES = (
        (INCREASE, 'Increase'),
        (DECREASE, 'Decrease'),
    )

    by_user = models.ForeignKey(User,
                                on_delete=models.CASCADE,
                                blank=False,
                                related_name='+')

    date = models.DateTimeField("Date of prediction",
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

    direction = models.IntegerField(choices=DIRECTION_CHOICES, default=DECREASE)

    result = models.IntegerField(choices=RESULT_CHOICES, default=PENDING)
