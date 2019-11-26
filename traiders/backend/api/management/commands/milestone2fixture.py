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

        users = []
        for i in range(500):
            first_name = random.choice(first_names)
            last_name = random.choice(last_names)
            city, country = random.choice(cities)

            u = User.objects.create(
                first_name=first_name,
                last_name=last_name,
                username=random.choice([first_name.lower(), last_name.lower()]) + str(random.randint(0, 100)),
                password='password',
                city=city,
                country=country,
                avatar=random.randint(1, 21)
            )

            users.append(u)

        data_path = os.path.join(os.path.dirname(__file__), 'data')

        for i in range(6):
            article_data = open(os.path.join(data_path, f'article{i}.txt')).read()
            image_url, title, content = article_data.split('\n', maxsplit=2)
            article = Article.objects.create(
                title=title,
                content=content,
                author=users[i]
            )
            article.image.save(f'img{i}.jpg', File(io.BytesIO(rq.get(image_url).content)))

            for j, comment in enumerate(open(os.path.join(data_path, f'article{i}_comments.txt'))):
                comment = comment[:-1]
                if comment:
                    ArticleComment.objects.create(
                        user=users[10 * i + j],
                        content=comment,
                        article=article
                    )

            n_likes = random.randint(0, 50)
            for j in range(n_likes):
                Like.objects.get_or_create(
                    user=random.choice(users),
                    article=article
                )

        # add random follows
        for u in users:
            if random.random() < 0.5:
                continue
            n_follow = random.randint(0, 5)
            for i in range(n_follow):
                Following.objects.get_or_create(
                    user_following=random.choice(users),
                    user_followed=u,
                    status=Following.ACCEPTED
                )

        #scenario 1

        u1 = User(
            first_name='Alperen',
            last_name='Duymaz',
            username='alperenduymaz',
            is_trader=True,
            is_private=False,
            city='Yozgat',
            country='TR',
            email_verified=True,
            iban='TR120001001745377120435001'
        )

        u1.set_password('Alperen123')
        u1.save()

        article_data = open(os.path.join(data_path, f'article6.txt')).read()
        image_url, title, content = article_data.split('\n', maxsplit=2)
        a1 = Article.objects.create(
            title=title,
            content=content,
            author=u1,
            created_at=make_aware(datetime(2019, 11, 19, 21, 10, 00))
        )
        a1.image.save(f'img6.jpg', File(io.BytesIO(rq.get(image_url).content)))
        for j, comment in enumerate(open(os.path.join(data_path, f'article6_comments.txt'))):
            comment = comment[:-1]
            if comment:
                ArticleComment.objects.create(
                    user=random.choice(users),
                    content=comment,
                    article=a1
                )

        # ton of likes
        for i in range(232):
            Like.objects.get_or_create(
                user=random.choice(users),
                article=a1
            )

        # ton of followers
        for i in range(101):
            Following.objects.get_or_create(
                user_following=random.choice(users),
                user_followed=u1,
                status=Following.ACCEPTED
            )

        # 95% prediction rate
        for i in range(50):
            Prediction.objects.create(
                direction=random.choice([Prediction.WILL_DECREASE, Prediction.WILL_INCREASE]),
                result=Prediction.FAILED if random.random() < 0.05 else Prediction.SUCCESSFUL,
                base_equipment=Equipment.objects.get(symbol='EUR'),
                target_equipment=Equipment.objects.get(symbol='TRY'),
                user=u1,
                date=make_aware(datetime(2019, 7, 1) + timedelta(days=i))
            )

        # scenario 2
        u2 = User(
            first_name='Sarper',
            last_name='Rahmetoğlu',
            username='sarper',
            is_trader=True,
            is_private=False,
            city='Dusseldorf',
            country='DE',
            email_verified=True,
            iban='TR150001001745342721325335'
        )

        u2.set_password('Sarper123')
        u2.save()
