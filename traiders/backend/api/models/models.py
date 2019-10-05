from django.utils.timezone import now
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator
from .users import UserManager


class User(AbstractUser):
    ROLES = (
        (1, 'Basic'),
        (2, 'Trader'),
        (3, 'Admin')
    )
    user_role = models.PositiveSmallIntegerField(choices=ROLES)
    objects = UserManager()

    class Meta:
        app_label = "api"


class Equipment(models.Model):
    name = models.CharField("Equipment Name",
                            max_length=64,
                            blank=False)

    category = models.CharField("Equipment Category",
                                max_length=16,
                                blank=False)

    symbol = models.CharField("Equipment Symbol",
                              max_length=8,
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


class BasicUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)


class TraderUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    iban = models.CharField(validators=[RegexValidator(regex='^.{34}$', message='IBAN length has to be 34', code='nomatch')],
                            max_length=64, blank=False, unique=True)
    preferred_currency = models.ForeignKey(Equipment, null=True, on_delete=models.SET_NULL)
