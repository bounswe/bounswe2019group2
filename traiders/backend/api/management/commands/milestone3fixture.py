import logging
import requests as rq
import random
import json
import os
import io
from itertools import chain
from datetime import timedelta

from django.core.management.base import BaseCommand, CommandError
from django.core.files import File
from django.utils.timezone import make_aware, datetime

from ...models import *

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = 'Generate fixture data for Milestone 2'

    def get_names(self):
        try:
            with open('/tmp/names.json', 'r') as f:
                return json.loads(f.read())
        except FileNotFoundError:
            last_names = (
                rq.get('http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/other/family.txt')
                  .text.splitlines()[5:]
            )

            first_names = [
                name

                for name in chain(
                    rq.get('http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/female.txt')
                      .text.splitlines(),
                    rq.get('http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/male.txt')
                      .text.splitlines()
                )

                if name and name[0] != '#'
            ]

            with open('/tmp/names.json', 'w') as f:
                f.write(json.dumps([last_names, first_names]))

            return self.get_names()

    def handle(self, *args, **options):
        last_names, first_names = self.get_names()

        cities = [
            ('Istanbul', 'TR'), ('Ankara', 'TR'), ('Izmir', 'TR'), ('Paris', 'FR'), ('Berlin', 'DE'),
            ('Moscow', 'RU'), ('New York', 'US'), ('Boston', 'US'), ('Houston', 'US')
        ]

        random.seed(144447)
        data_path = os.path.join(os.path.dirname(__file__), 'data')
        users = User.objects.all()

        u3 = User(
            first_name='Nihan',
            last_name='Yaktir',
            username='nihan',
            is_trader=True,
            is_private=False,
            city='Istanbul',
            country='TR',
            email_verified=True,
            iban='TR150001001745342721325335'
        )

        u3.set_password('nihan123')
        u3.save()

        u4 = User(
            first_name='Talat',
            last_name='Jackson',
            username='talat',
            is_trader=True,
            is_private=False,
            city='London',
            country='UK',
            email_verified=True,
            iban='TR150001001745342721325335'
        )

        u4.set_password('talat123')
        u4.save()

        article_data = open(os.path.join(data_path, f'milestone3_scenario3_article1.txt')).read()
        image_url, title, content = article_data.split('\n', maxsplit=2)
        a3 = Article.objects.create(
            title=title,
            content=content,
            author=u3,
            created_at=make_aware(datetime(2019, 11, 19, 21, 10, 00))
        )
        a3.image.save(f'img331.jpg', File(io.BytesIO(rq.get(image_url).content)))

        article_data = open(os.path.join(data_path, f'milestone3_scenario3_article2.txt')).read()
        image_url, title, content = article_data.split('\n', maxsplit=2)
        a4 = Article.objects.create(
            title=title,
            content=content,
            author=u4,
            created_at=make_aware(datetime(2019, 11, 19, 21, 10, 00))
        )
        a4.image.save(f'img332.jpg', File(io.BytesIO(rq.get(image_url).content)))

        Asset.objects.create(user=u3,
                             amount=1000,
                             equipment=Equipment.objects.get(symbol='GBP'))
        OnlineInvestment.objects.create(date=make_aware(datetime(2019, 11, 19, 21, 10, 00)),
                                        user=u3,
                                        base_equipment=Equipment.objects.get(symbol='GBP'),
                                        target_equipment=Equipment.objects.get(symbol='TRY'),
                                        base_amount=300,
                                        target_amount=2100
                                        )

        p1 = Portfolio.objects.create(name="PoundTrack",
                                      user=u3)

        PortfolioItem.objects.create(base_equipment=Equipment.objects.get(symbol='TRY'),
                                     target_equipment=Equipment.objects.get(symbol='GBP'),
                                     portfolio=p1)

        PortfolioItem.objects.create(base_equipment=Equipment.objects.get(symbol='USD'),
                                     target_equipment=Equipment.objects.get(symbol='GBP'),
                                     portfolio=p1)

        PortfolioItem.objects.create(base_equipment=Equipment.objects.get(symbol='EUR'),
                                     target_equipment=Equipment.objects.get(symbol='GBP'),
                                     portfolio=p1)

        # 95% prediction rate
        for i in range(300):
            Prediction.objects.create(
                direction=random.choice([Prediction.WILL_DECREASE, Prediction.WILL_INCREASE]),
                result=Prediction.FAILED if random.random() < 0.05 else Prediction.SUCCESSFUL,
                base_equipment=Equipment.objects.get(symbol='GBP'),
                target_equipment=Equipment.objects.get(symbol='EUR'),
                user=u4,
                date=make_aware(datetime(2019, 7, 1) + timedelta(days=i))
            )

        p2 = Portfolio.objects.create(name="Non-Conventional Pound Predictors",
                                      user=u4)

        PortfolioItem.objects.create(base_equipment=Equipment.objects.get(symbol='GOOGL'),
                                     target_equipment=Equipment.objects.get(symbol='GBP'),
                                     portfolio=p2)

        PortfolioItem.objects.create(base_equipment=Equipment.objects.get(symbol='BTC'),
                                     target_equipment=Equipment.objects.get(symbol='GBP'),
                                     portfolio=p2)

        PortfolioItem.objects.create(base_equipment=Equipment.objects.get(symbol='EUR'),
                                     target_equipment=Equipment.objects.get(symbol='GBP'),
                                     portfolio=p2)

        PortfolioItem.objects.create(base_equipment=Equipment.objects.get(symbol='JPY'),
                                     target_equipment=Equipment.objects.get(symbol='GBP'),
                                     portfolio=p2)

        for i in range(78):
            Following.objects.get_or_create(
                user_following=random.choice(users),
                user_followed=u4,
                status=Following.ACCEPTED
            )

        Following.objects.get_or_create(user_following=u3,
                                        user_followed=u4,
                                        status=Following.ACCEPTED)

        Prediction.objects.create(
            direction=random.choice([Prediction.WILL_DECREASE, Prediction.WILL_INCREASE]),
            result=Prediction.FAILED if random.random() < 0.05 else Prediction.SUCCESSFUL,
            base_equipment=Equipment.objects.get(symbol='GBP'),
            target_equipment=Equipment.objects.get(symbol='TRY'),
            user=u3,
            date=make_aware(datetime(2019, 7, 1) + timedelta(days=i))
        )

        for j, comment in enumerate(open(os.path.join(data_path, f'article{i}_comments.txt'))):
            comment = comment[:-1]
            if comment:
                ArticleComment.objects.create(
                    user=users[10 * i + j],
                    content=comment,
                    article=a3
                )

        n_likes = random.randint(0, 50)
        for j in range(n_likes):
            Like.objects.get_or_create(
                user=random.choice(users),
                article=a3
            )

        for j, comment in enumerate(open(os.path.join(data_path, f'article0_comments.txt'))):
            comment = comment[:-1]
            if comment:
                ArticleComment.objects.create(
                    user=users[10 * i + j],
                    content=comment,
                    article=a4
                )

        n_likes = random.randint(0, 50)
        for j in range(n_likes):
            Like.objects.get_or_create(
                user=random.choice(users),
                article=a4
            )
