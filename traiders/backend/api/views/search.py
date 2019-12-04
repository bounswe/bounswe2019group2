
from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins, status
from django.db.models import Q
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import serializers
import requests as rq
import logging

from ..models import *
from ..serializers import *

MAX_ITEMS = 5
logger = logging.getLogger(__name__)


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
    def find_closest(keyword, top_k=10):
        words = keyword.split(' ')
        kws = []
        for word in words:
            kws.append((1, word))
        keyword = keyword.replace(' ', '+')
        res = rq.get(f'https://api.datamuse.com/words?ml={keyword}&max={top_k}')
        similars = res.json()
        if res.status_code != 200:
            logger.log("Datamuse returned non-200")
            return kws

        if similars != []:
            max_score = similars[0]['score']
            for dct in similars[:top_k]:
                kws.append((dct['score'] / max_score, dct['word']))
        return kws

    @staticmethod
    def iterate_and_add(kw_objects, serializer, context):
        objects = serializer(kw_objects, many=True, context=context).data
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
        articles = list()
        events = list()
        parities = list()
        equipments = list()
        users = list()

        for kw in keywords:
            articles.extend(self.iterate_and_add(Article.objects.filter(content__contains=kw[1])[:MAX_ITEMS],
                                                 ArticleSerializer,
                                                 context))
            events.extend(self.iterate_and_add(Event.objects.filter(event__contains=kw[1])[:MAX_ITEMS],
                                               EventSerializer,
                                               context))
            parities.extend(self.iterate_and_add(Parity.objects.filter(
                Q(base_equipment__name__contains=kw[1]) | Q(target_equipment__name__contains=kw[1]))[:MAX_ITEMS],
                ParitySerializer,
                context))
            equipments.extend(self.iterate_and_add(Equipment.objects.filter(name__contains=kw[1])[:MAX_ITEMS],
                                                   EquipmentSerializer,
                                                   context))
            users.extend(self.iterate_and_add(User.objects.filter(username__contains=kw[1])[:MAX_ITEMS],
                                              UserSerializer,
                                              context))

        all_objects = dict()
        all_objects["articles"] = articles
        all_objects["events"] = events
        all_objects["users"] = users
        all_objects["equipments"] = equipments
        all_objects["parities"] = parities

        return Response(all_objects)
