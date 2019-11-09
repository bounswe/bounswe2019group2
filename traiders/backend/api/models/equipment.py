from django.db import models


class Equipment(models.Model):
    name = models.CharField("Equipment Name",
                            max_length=64,
                            blank=False)

    # TODO use choice here
    # TODO make choices seen in doc
    category = models.CharField("Equipment Category",
                                max_length=16,
                                blank=False)

    symbol = models.CharField("Equipment Symbol",
                              max_length=32,
                              blank=False,
                              unique=True)

    def __str__(self):
        return self.symbol
