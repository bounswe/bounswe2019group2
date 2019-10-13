from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from ..models.article import Article
from ..serializers.article import ArticleSerializer


class ArticleViewSet(mixins.CreateModelMixin,
                     mixins.RetrieveModelMixin,
                     mixins.UpdateModelMixin,
                     mixins.DestroyModelMixin,
                     GenericViewSet):
    """
    View and edit articles
    """
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArticleSerializer
    queryset = Article.objects.all()
