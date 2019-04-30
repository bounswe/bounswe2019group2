from django.db import models
from django.contrib.auth.models import User


class RegisteredUser(User):
    balance = models.CharField(max_length=50,null=True, blank=True)

    def _str_(self):
        return self.first_name._str() + " " + self.last_name.str_()