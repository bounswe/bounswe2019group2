from rest_framework.routers import DefaultRouter
from rest_framework.schemas import get_schema_view
from django.urls import path
from django.views.generic import TemplateView
from .views import UserViewSet, TokenViewSet, ParityViewSet, EquipmentViewSet, ArticleViewSet


router = DefaultRouter()
router.register(r'users', UserViewSet, basename='user')
router.register(r'token', TokenViewSet, basename='token')
router.register(r'equipment', EquipmentViewSet, basename='equipment')
router.register(r'parity', ParityViewSet, basename='parity')
router.register(r'articles', ArticleViewSet, basename='article')


urlpatterns = [
    # documentation view
    path('docs/', TemplateView.as_view(
        template_name='swagger-ui.html',
        extra_context={'schema_url': 'openapi-schema'}
    ), name='docs'),

    # OpenAPI schema
    path('openapi/', get_schema_view(
        title="TrAiders",
        description="TrAiders API Schema",
    ), name='openapi-schema'),

    # all API ends
    *router.urls
]
