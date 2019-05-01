from django.urls import path
from . import views

urlpatterns = [
    path('helloworld/', views.HelloWorldView.as_view(), name='helloworld'),
    path('login/', views.LoginAPIView.as_view(), name='login'),
    path('investments/', views.InvestmentsView.as_view(), name='investments'),
]