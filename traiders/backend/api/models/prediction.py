from django.db import models
from django.utils.timezone import now
from .parity import Parity
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
    WILL_INCREASE = 1
    WILL_DECREASE = 0
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
                            default=now)

    parity = models.ForeignKey(Parity,
                               on_delete=models.CASCADE,
                               blank=False,
                               related_name='+')

    direction = models.IntegerField(choices=DIRECTION_CHOICES, blank=False, default=WILL_DECREASE)

    result = models.IntegerField(choices=RESULT_CHOICES, default=PENDING)

    class Meta:
        unique_together = ('date', 'by_user', 'parity')
