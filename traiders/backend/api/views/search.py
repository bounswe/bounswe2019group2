
from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins, status
from django.db.models import Q
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import serializers

from ..models import *
from ..serializers import *

MAX_ITEMS = 5
class SearchViewSet(GenericViewSet):
    """
    View searching a given string
    """
    filter_backends = [DjangoFilterBackend]

    class serializer_class(serializers.Serializer):  # this is just for schema generation, not used
        base_equipment = EquipmentSerializer()
        target_equipment = EquipmentSerializer()
        success_rate = serializers.FloatField()
        prediction_count = serializers.IntegerField()
        user = UserSerializer()

    @staticmethod
    def find_closest(keyword, k=1):
        if k == 1:
            kws = [(1, keyword)]
            return kws

    @staticmethod
    def iterate_and_add(kw_objects, serializer, context):
        objects = []
        for i, object in enumerate(kw_objects):
            objects.append(serializer(object, context=context).data)
        return objects

    def list(self, request):
        params = request.query_params

        if ('keyword' not in request.query_params) or request.query_params["keyword"] == "":
            return Response({
                'non_field_errors': ['Please provide a keyword to conduct search.']
            }, status=status.HTTP_400_BAD_REQUEST)

        context = self.get_serializer_context()
        keywords = self.find_closest(params["keyword"])

        # Sort by relevance
        keywords = sorted(keywords, key=lambda x: x[0])

        for kw in keywords:
            articles = self.iterate_and_add(Article.objects.filter(content__contains=kw[1])[:MAX_ITEMS],
                                            ArticleSerializer,
                                            context)
            events = self.iterate_and_add(Event.objects.filter(event__contains=kw[1])[:MAX_ITEMS],
                                          EventSerializer,
                                          context)
            parities = self.iterate_and_add(Parity.objects.filter(Q(base_equipment__name__contains=kw[1]) |
                                                                  Q(target_equipment__name__contains=kw[1]))[:MAX_ITEMS],
                                            ParitySerializer,
                                            context)
            equipments = self.iterate_and_add(Equipment.objects.filter(name__contains=kw[1])[:MAX_ITEMS],
                                              EquipmentSerializer,
                                              context)
            users = self.iterate_and_add(User.objects.filter(username__contains=kw[1])[:MAX_ITEMS],
                                         UserSerializer,
                                         context)
        all_objects = dict()
        all_objects["articles"] = articles
        all_objects["events"] = events
        all_objects["users"] = users
        all_objects["equipments"] = equipments
        all_objects["parities"] = parities

        return Response(all_objects)
