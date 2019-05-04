from django.urls import path
from . import views

urlpatterns = [
    path('helloworld/', views.HelloWorldView.as_view(), name='helloworld'),
    path('register/', views.RegisterView.as_view(), name='register'),
    path('helloworld/', views.HelloWorldView.as_view(), name='helloworld'),
    path('login/', views.LoginAPIView.as_view(), name='login'),
    path('investments/total_profit', views.TotalProfitAPIView.as_view(), name='total profit'),
    path('investments/profit', views.InvestmentProfitAPIView.as_view(), name='profit'),
    path('investments/', views.InvestmentsAPIView.as_view(), name='create/delete/list investments'),
    path('parity/<date>/', views.ParityView.as_view(), name='parity history')
]