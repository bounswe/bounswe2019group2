from django.urls import path
from django.conf.urls import url
from . import views

urlpatterns = [
    path('helloworld/', views.HelloWorldView.as_view(), name='helloworld'),
    path('login/', views.LoginAPIView.as_view(), name='login'),
    path('investments/total_profit', views.TotalProfitAPIView.as_view(), name='total profit'),
]