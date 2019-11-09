from django.db import models


class Equipment(models.Model):
    CATEGORY_CHOICES = (
        ('currency', 'currency'),
        ('crypto', 'crypto'),
        ('stock', 'stock'),
    )

    name = models.CharField("Equipment Name",
                            max_length=64,
                            blank=False)

    category = models.CharField("Equipment Category",
                                max_length=16,
                                blank=False,
                                choices=CATEGORY_CHOICES)

    symbol = models.CharField("Equipment Symbol",
                              max_length=32,
                              blank=False,
                              unique=True)

    def __str__(self):
        return self.symbol
