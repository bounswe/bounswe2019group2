from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins

from .models import Annotation
from .serializers import AnnotationSerializer


class AnnotationViewSet(mixins.CreateModelMixin,
                        mixins.RetrieveModelMixin,
                        mixins.DestroyModelMixin,
                        mixins.ListModelMixin,
                        GenericViewSet):
    queryset = Annotation.objects.all()
    serializer_class = AnnotationSerializer
