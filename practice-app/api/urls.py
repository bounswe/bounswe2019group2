from django.urls import path

from . import views

urlpatterns = [
    path('helloworld/', views.HelloWorldView.as_view(), name='helloworld'),
    path('register/', views.RegisterView.as_view(), name='register'),
]