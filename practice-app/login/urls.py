from django.conf.urls import url
from login.views import *

urlpatterns = [
    url(r'^login$', LoginAPIView.as_view()),
]