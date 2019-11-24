import logging
import requests as rq
import random
import json
import os
import io
from itertools import chain

from django.core.management.base import BaseCommand, CommandError
from django.core.files import File

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
                country=country
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

            n_likes = random.randint(0, 100)
            for j in range(n_likes):
                Like.objects.create(
                    user=random.choice(users),
                    article=article
                )
