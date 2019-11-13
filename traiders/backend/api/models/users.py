from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator
from django.db import models
from django_countries.fields import CountryField


class User(AbstractUser):
    is_trader = models.BooleanField(default=False)
    iban = models.CharField(
        validators=[RegexValidator(regex='^.{34}$', message='IBAN length has to be 34', code='nomatch')],
        max_length=64, blank=True)
    city = models.CharField(max_length=64, blank=False)
    country = CountryField(default="TR")
    is_private = models.BooleanField(default=False)
    avatar = models.IntegerField(blank=True, default=1, choices=[(i, i) for i in range(1, 21)])
    email_verified = models.BooleanField(default=True)  # TODO add email verification
