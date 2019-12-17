from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins, status
from django.db.models import Q
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import serializers
import requests as rq
import logging

from ..models import *
from ..serializers import *

MAX_ITEMS = 5
logger = logging.getLogger(__name__)


class RecommendationViewSet(GenericViewSet):
    """
    View searching a given string
    """
    filter_backends = [DjangoFilterBackend]
    permission_classes = (IsAuthenticated,)

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
    def iterate_and_add(kw_objects, serializer, context, keys, all_objects, msgs):
        objects = serializer(kw_objects, many=True, context=context).data
        if objects != list():
            for i in range(len(objects)):
                idx = objects[i]["id"]
                if idx not in all_objects:
                    all_objects[idx] = objects[i]
                    all_objects[idx]["messages"] = list()
                all_objects[idx]["messages"].extend(list(msgs))
        keys.update([o["id"] for o in objects])
        return objects

    def list(self, request):
        main_keywords = dict()
        req_user = request.user

        # Made predictions about
        past_predictions = Prediction.objects.all().filter(user=req_user)
        pred_message = "You are receiving this since you made a prediction about {}/{}" \
                       " in the past."

        for prediction in past_predictions:
            msg = pred_message.format(prediction.base_equipment.symbol,
                                      prediction.target_equipment.symbol)
            if prediction.base_equipment.name not in main_keywords:
                main_keywords[prediction.base_equipment.name] = list()

            main_keywords[prediction.base_equipment.name].append(msg)

            if prediction.target_equipment.name not in main_keywords:
                main_keywords[prediction.target_equipment.name] = list()

            main_keywords[prediction.target_equipment.name].append(msg)

        user_portfolios = Portfolio.objects.all().filter(user=req_user)

        portfolio_msg = "You are receiving this since you have {}/{} " \
                        "in one of your portfolios."

        for portfolio in user_portfolios:
            items = PortfolioItem.objects.all().filter(portfolio=portfolio)
            for item in items:
                msg = portfolio_msg.format(item.base_equipment.symbol,
                                           item.target_equipment.symbol)
                if item.base_equipment.name not in main_keywords:
                    main_keywords[item.base_equipment.name] = list()

                main_keywords[item.base_equipment.name].append(msg)

                if item.target_equipment.name not in main_keywords:
                    main_keywords[item.target_equipment.name] = list()

                main_keywords[item.target_equipment.name].append(msg)

        investments = OnlineInvestment.objects.all().filter(user=req_user)
        manual_investment = ManualInvestment.objects.all().filter(user=req_user)
        all_investments = list(investments) + list(manual_investment)
        inv_message = "You are receiving this since you have an investment on {}/{}" \
                      " parity in the past."

        for investment in all_investments:
            msg = inv_message.format(investment.base_equipment.symbol,
                                     investment.target_equipment.symbol)
            if investment.base_equipment.name not in main_keywords:
                main_keywords[investment.base_equipment.name] = list()

            main_keywords[investment.base_equipment.name].append(msg)

            if investment.target_equipment.name not in main_keywords:
                main_keywords[investment.target_equipment.name] = list()

            main_keywords[investment.target_equipment.name].append(msg)

        articles = Article.objects.all().filter(author=req_user)
        article_msg = "You are receiving this since you have an article on {}"
        for article in articles:
            title = article.title
            words = title.split(" ")
            msg = article_msg.format(title)

            for word in words:
                if word not in main_keywords:
                    main_keywords[word] = list()
                main_keywords[word].append(msg)

        events = Event.objects.all().filter(followed_by=req_user)
        event_msg = "You are receiving this since you are following {} event"

        for event in events:
            title = event.event
            words = title.split(" ")
            msg = event_msg.format(title)
            for word in words:
                if word not in main_keywords:
                    main_keywords[word] = list()
                main_keywords[word].append(msg)

        followed_users = Following.objects.all().filter(user_following=req_user).values('user_followed')
        user_kws = []
        for user in followed_users:
            user = User.objects.get(pk=user["user_followed"])
            user_kws.append((user, "You are receiving this since you follow {}".format(user.username)))

        keywords = []
        for kw, msgs in main_keywords.items():
            keywords.append((msgs, kw))

        # Sort by relevance
        keywords = sorted(keywords, key=lambda x: -len(x[0]))
        articles, a_keys = dict(), set()
        events, ev_keys = dict(), set()
        parities, p_keys = dict(), set()
        equipments, eq_keys = dict(), set()
        users, u_keys = dict(), set()

        context = self.get_serializer_context()
        for kw in keywords:
            msgs = kw[0]
            q_article = Q(content__contains=kw[1]) | Q(author__username__contains=kw[1]) | Q(title__contains=kw[1])
            q_article = q_article

            (self.iterate_and_add(Article.objects.filter(q_article)[:MAX_ITEMS],
                                  ArticleSerializer,
                                  context,
                                  a_keys,
                                  articles,
                                  msgs))

            q_event = Q(event__contains=kw[1]) | Q(country__contains=kw[1]) | Q(category__contains=kw[1])
            q_event = q_event
            (self.iterate_and_add(Event.objects.filter(q_event)[:MAX_ITEMS],
                                  EventSerializer,
                                  context,
                                  ev_keys,
                                  events,
                                  msgs))

            q_parity = Q(base_equipment__name__contains=kw[1]) | Q(target_equipment__name__contains=kw[1])
            q_parity = q_parity | Q(base_equipment__symbol__contains=kw[1]) | Q(
                target_equipment__symbol__contains=kw[1])
            q_parity = q_parity

            (self.iterate_and_add(Parity.objects.filter(q_parity)[:MAX_ITEMS],
                                  ParitySerializer,
                                  context,
                                  p_keys,
                                  parities,
                                  msgs))

            q_equipment = Q(name__contains=kw[1]) | Q(symbol__contains=kw[1])
            q_equipment = q_equipment

            (self.iterate_and_add(Equipment.objects.filter(q_equipment)[:MAX_ITEMS],
                                  EquipmentSerializer,
                                  context,
                                  eq_keys,
                                  equipments,
                                  msgs))

            q_user = Q(username__contains=kw[1]) | Q(first_name__contains=kw[1]) | Q(last_name__contains=kw[1])
            q_user = q_user

            (self.iterate_and_add(User.objects.filter(q_user)[:MAX_ITEMS],
                                  UserSerializer,
                                  context,
                                  u_keys,
                                  users,
                                  msgs))

        all_objects = dict()
        all_objects["articles"] = sorted(articles.values(), key=lambda x: -len(x["messages"]))
        all_objects["events"] = sorted(events.values(), key=lambda x: -len(x["messages"]))
        all_objects["users"] = sorted(users.values(), key=lambda x: -len(x["messages"]))
        all_objects["equipments"] = sorted(equipments.values(), key=lambda x: -len(x["messages"]))
        all_objects["parities"] = sorted(parities.values(), key=lambda x: -len(x["messages"]))

        return Response(all_objects)
