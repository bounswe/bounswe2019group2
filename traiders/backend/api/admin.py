from django.contrib import admin
from .models import *

admin.site.register(User)
admin.site.register(Equipment)
admin.site.register(ManualInvestment)
admin.site.register(Parity)
admin.site.register(Article)
admin.site.register(ArticleComment)
