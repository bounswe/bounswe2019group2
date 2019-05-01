from django.urls import path
from django.conf.urls import url
from . import views

urlpatterns = [
    path('helloworld/', views.HelloWorldView.as_view(), name='helloworld'),

    path('register/', views.RegisterView.as_view(), name='register'),

    path('login/', views.LoginAPIView.as_view(), name='login'),

]