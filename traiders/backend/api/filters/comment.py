from django_filters import rest_framework as filters

from ..models import ArticleComment, EquipmentComment, Equipment


class ArticleCommentFilterSet(filters.FilterSet):
    article = filters.NumberFilter()

    class Meta:
        model = ArticleComment
        fields = {"article": ["exact"]}


class EquipmentCommentFilterSet(filters.FilterSet):
    equipment = filters.ModelChoiceFilter(queryset=Equipment.objects.all())

    class Meta:
        model = EquipmentComment
        fields = {"equipment": ["exact"]}
