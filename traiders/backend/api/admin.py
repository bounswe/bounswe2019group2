from django.contrib import admin
from .models.user import User
from .models.equipment import Equipment
from .models.investment import ManualInvestment
from .models.parity import Parity

admin.site.register(User)
admin.site.register(Equipment)
admin.site.register(ManualInvestment)
admin.site.register(Parity)
