from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator
from django.db import models


class User(AbstractUser):
    is_trader = models.BooleanField(default=False)
    iban = models.CharField(
        validators=[RegexValidator(regex='^.{34}$', message='IBAN length has to be 34', code='nomatch')],
        max_length=64, blank=True)
    city = models.CharField(max_length=64, blank=False)
    country = models.CharField(max_length=64, blank=False)
