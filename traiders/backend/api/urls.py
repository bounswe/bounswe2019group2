from rest_framework.routers import DefaultRouter
from rest_framework.schemas import get_schema_view
from django.urls import path, include
from django.views.generic import TemplateView
from .views import *

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='user')
router.register(r'token', TokenViewSet, basename='token')
router.register(r'equipment', EquipmentViewSet, basename='equipment')
router.register(r'parity/latest', ParityLatestViewSet, basename='parity-latest')
router.register(r'parity', ParityViewSet, basename='parity')
router.register(r'articles', ArticleViewSet, basename='article')
router.register(r'likes', LikeViewSet, basename='like')

router.register(r'following', FollowingViewSet, basename='following')
router.register(r'comments/article', ArticleCommentViewSet, basename='articlecomment')
router.register(r'comments/equipment', EquipmentCommentViewSet, basename='equipmentcomment')
router.register(r'events', EventViewSet, basename='event')

urlpatterns = [
    # documentation views
    path('docs/', TemplateView.as_view(
        template_name='swagger-ui.html',
        extra_context={'schema_url': 'openapi-schema'}
    ), name='docs'),

    path('redocs/', TemplateView.as_view(
        template_name='redoc.html',
        extra_context={'schema_url': 'openapi-schema'}
    ), name='redocs'),

    # OpenAPI schema
    path('openapi/', get_schema_view(
        title="TrAiders",
        description="TrAiders API Schema",
    ), name='openapi-schema'),

    # Browsable API login logout views
    path('api-auth/', include('rest_framework.urls')),

    # Link to latest mobile application
    path('mobile/', latest_mobile_app),

    # all API ends
    *router.urls
]
