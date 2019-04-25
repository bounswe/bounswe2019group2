from django.contrib import admin
from .models import Parity, Equipment, ManualInvestment

# Register your models here.
admin.site.register(Equipment)
admin.site.register(ManualInvestment)
admin.site.register(Parity)