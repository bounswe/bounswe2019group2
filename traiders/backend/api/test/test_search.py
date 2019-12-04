from rest_framework.test import APITestCase

from ..models import *


class SearchViewSetTestCase(APITestCase):
    def setUp(self):
        equipment1_data = {
            "symbol": "USD",
            "name": "US Dollars",
            "category": "currency"
        }

        equipment2_data = {
            "symbol": "EUR",
            "name": "Euros",
            "category": "currency"
        }

        equipment3_data = {
            "symbol": "TRY",
            "name": "Turkish Liras",
            "category": "currency"
        }

        equipment4_data = {
            "symbol": "BTC",
            "name": "Bitcoin",
            "category": "crypto"
        }

        dollar = Equipment(**equipment1_data)
        euro = Equipment(**equipment2_data)
        turkish_liras = Equipment(**equipment3_data)
        bitcoin = Equipment(**equipment4_data)
        dollar.save()
        euro.save()
        turkish_liras.save()
        bitcoin.save()

        parity1_data = {
            "base_equipment": euro,
            "target_equipment": dollar,
            "ratio": 0.9
        }
        parity2_data = {
            "base_equipment": dollar,
            "target_equipment": turkish_liras,
            "ratio": 5.8
        }

        parity3_data = {
            "base_equipment": turkish_liras,
            "target_equipment": dollar,
            "ratio": 0.15
        }

        parity4_data = {
            "base_equipment": bitcoin,
            "target_equipment": dollar,
            "ratio": 8257.79
        }

        parity5_data = {
            "base_equipment": turkish_liras,
            "target_equipment": bitcoin,
            "ratio": 0.000021
        }

        for data in [parity1_data, parity2_data, parity3_data, parity4_data, parity5_data]:
            for key in ['high', 'close', 'open', 'low']:
                data[key] = data['ratio']
            del data['ratio']

        eur_dollar = Parity(**parity1_data)
        dollar_try = Parity(**parity2_data)
        try_dollar = Parity(**parity3_data)
        btc_usd = Parity(**parity4_data)
        try_btc = Parity(**parity5_data)
        eur_dollar.save()
        dollar_try.save()
        try_dollar.save()
        btc_usd.save()
        try_btc.save()

        user_data = {
            'username': 'investorNYC',
            'first_name': 'Jesse',
            'last_name': 'Kean',
            'email': 'jk@newyork.com',
        }

        self.user = User(**user_data)
        self.user.set_password('A7b8CdjK')
        self.user.save()

        data = {
            'author': self.user,
            'title': 'Uncertainty',
            'content': 'Uncertainty has been a common theme throughout 2019, and the third quarter proved no different.',
        }
        self.article = Article(**data)
        self.article.save()

    def test_search_euro(self):
        response = self.client.get('/search/', data={"keyword": "euros"})
        results = response.data
        self.assertNotEquals(results['parities'], [])
        self.assertNotEquals(results['equipments'], [])

    def test_search_multiple_words(self):
        response = self.client.get('/search/', data={"keyword": "us dollars"})
        results = response.data
        self.assertNotEquals(results['parities'], [])
        self.assertNotEquals(results['equipments'], [])

    def test_search_article(self):
        response = self.client.get('/search/', data={"keyword": "uncertainty"})
        results = response.data
        self.assertNotEquals(results['articles'], [])
        kw_article = results['articles'][0]
        self.assertEqual(self.article.pk, kw_article['id'])

    def test_search_user(self):
        response = self.client.get('/search/', data={"keyword": "NYC"})
        results = response.data
        self.assertNotEquals(results['users'], [])
        kw_user = results['users'][0]
        self.assertEqual(self.user.username, kw_user['username'])
