from django.test import TestCase
from django.utils.timezone import make_aware, datetime

from ..models import Parity
from ..models import Equipment


class TestEndofDayParityClean(TestCase):
    def setUp(self):
        self.e1 = Equipment.objects.create(symbol='USD', name='U.S Dollar')
        self.e2 = Equipment.objects.create(symbol='TRY', name='Turkish Liras')

    def test_frequent(self):
        # test hourly updated parity
        data = {
            'base_equipment': self.e1,
            'target_equipment': self.e2,
            'open': 0,
            'close': 0,
            'high': 0,
            'low': 0
        }

        # previous days' parities
        Parity.objects.create(**data, date=make_aware(datetime(2019, 1, 8, 0)))
        Parity.objects.create(**data, date=make_aware(datetime(2019, 1, 9, 0)))

        self.assertEqual(Parity.objects.count(), 2)

        # today's parities
        for i in range(24):
            last_pk = Parity.objects.create(**data, date=make_aware(datetime(2019, 1, 10, i))).pk

        self.assertEqual(Parity.objects.count(), 26)

        # day changes
        Parity.objects.create(**data, date=make_aware(datetime(2019, 1, 11, 0)))

        self.assertEqual(Parity.objects.count(), 4)

        # ensure the last one is not deleted, and its time is 0
        self.assertTrue(Parity.objects.filter(pk=last_pk).exists())
        self.assertEqual(Parity.objects.get(pk=last_pk).date, make_aware(datetime(2019, 1, 10, 0)))

    def test_infrequent(self):
        data = {
            'base_equipment': self.e1,
            'target_equipment': self.e2,
            'open': 0,
            'close': 0,
            'high': 0,
            'low': 0
        }

        for i in range(1, 5):
            Parity.objects.create(**data, date=make_aware(datetime(2019, 1, i, 0)))
            self.assertEqual(Parity.objects.count(), i)
