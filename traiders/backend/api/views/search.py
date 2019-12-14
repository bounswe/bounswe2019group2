
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

        res = rq.get('https://api.datamuse.com/words', params={'ml': keyword, 'max': top_k})

        if res.status_code != 200:
            logger.warning("Datamuse returned non-200")
            return kws

        similars = res.json()
        if similars != []:
            max_score = similars[0]['score']
            for dct in similars[:top_k]:
                kws.append((dct['score'] / max_score, dct['word']))
        return kws

    @staticmethod
    def iterate_and_add(kw_objects, serializer, context, keys):
        objects = serializer(kw_objects, many=True, context=context).data
        keys.update([o["id"] for o in objects])
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
        keywords = sorted(keywords, key=lambda x: -x[0])
        articles, a_keys = list(), set()
        events, ev_keys = list(), set()
        parities, p_keys = list(), set()
        equipments, eq_keys = list(), set()
        users, u_keys = list(), set()

        for kw in keywords:

            q_article = Q(content__icontains=kw[1]) | Q(author__username__icontains=kw[1]) | Q(title__icontains=kw[1])
            q_article = q_article & ~Q(id__in=a_keys)

            articles.extend(self.iterate_and_add(Article.objects.filter(q_article)[:MAX_ITEMS],
                                                 ArticleSerializer,
                                                 context,
                                                 a_keys))
            q_event = Q(event__icontains=kw[1]) | Q(country__icontains=kw[1]) | Q(category__icontains=kw[1])
            q_event = q_event & ~Q(id__in=ev_keys)
            events.extend(self.iterate_and_add(Event.objects.filter(q_event)[:MAX_ITEMS],
                                               EventSerializer,
                                               context,
                                               ev_keys))

            q_parity = Q(base_equipment__name__icontains=kw[1]) | Q(target_equipment__name__icontains=kw[1])
            q_parity = q_parity | Q(base_equipment__symbol__icontains=kw[1]) | Q(target_equipment__symbol__icontains=kw[1])
            q_parity = q_parity & ~Q(id__in=p_keys)

            parities.extend(self.iterate_and_add(Parity.objects.filter(q_parity)[:MAX_ITEMS],
                                                 ParitySerializer,
                                                 context,
                                                 p_keys))

            q_equipment = Q(name__icontains=kw[1]) | Q(symbol__icontains=kw[1])
            q_equipment = q_equipment & ~Q(id__in=eq_keys)

            equipments.extend(self.iterate_and_add(Equipment.objects.filter(q_equipment)[:MAX_ITEMS],
                                                   EquipmentSerializer,
                                                   context,
                                                   eq_keys))

            q_user = Q(username__icontains=kw[1]) | Q(first_name__icontains=kw[1]) | Q(last_name__icontains=kw[1])
            q_user = q_user & ~Q(id__in=u_keys)

            users.extend(self.iterate_and_add(User.objects.filter(q_user)[:MAX_ITEMS],
                                              UserSerializer,
                                              context,
                                              u_keys))

        all_objects = dict()
        all_objects["articles"] = articles
        all_objects["events"] = events
        all_objects["users"] = users
        all_objects["equipments"] = equipments
        all_objects["parities"] = parities

        return Response(all_objects)
