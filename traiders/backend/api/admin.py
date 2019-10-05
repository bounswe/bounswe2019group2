from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .models.models import Equipment, ManualInvestment, Parity
from .models.models import User, BasicUser, TraderUser


admin.site.register(User, UserAdmin)
admin.site.register(BasicUser)
admin.site.register(TraderUser)
admin.site.register(Equipment)
admin.site.register(ManualInvestment)
admin.site.register(Parity)
