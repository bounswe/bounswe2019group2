from django.urls import path

from . import views

urlpatterns = [
    path('helloworld/', views.HelloWorldView.as_view(), name='helloworld'),
    path('paritylist/', views.ParityListView.as_view(), name='paritylist'),
]
