from django.views.generic import TemplateView
from django.urls import path
from rest_framework.schemas import get_schema_view
from rest_framework.routers import DefaultRouter

from .views import AnnotationViewSet

router = DefaultRouter()
router.register(r'annotations', AnnotationViewSet, basename='annotation')


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
        title="TrAiders Annotation Server",
        description="TrAiders Annotation API Schema",
    ), name='openapi-schema'),

    *router.urls,

]
