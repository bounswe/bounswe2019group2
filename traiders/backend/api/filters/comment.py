from django_filters import rest_framework as filters

from ..models import Comment


class CommentFilterSet(filters.FilterSet):
    article = filters.NumberFilter()

    class Meta:
        model = Comment
        fields = {"article": ["exact"]}
