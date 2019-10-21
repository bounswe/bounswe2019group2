from django.contrib import admin
from .models.users import User
from .models.equipment import Equipment
from .models.investment import ManualInvestment
from .models.parity import Parity
from .models.article import Article
from .models.mobile_app import MobileApp


admin.site.register(User)
admin.site.register(Equipment)
admin.site.register(ManualInvestment)
admin.site.register(Parity)
admin.site.register(Article)
admin.site.register(MobileApp)
