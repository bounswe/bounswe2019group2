import logging
from django.dispatch.dispatcher import receiver
from django.db.models.signals import pre_save
from django.db import transaction
import datetime
from ..models import Parity, Prediction

_DAY_CLOSING = datetime.time(hour=18, minute=30)
logger = logging.getLogger(__name__)


@receiver(pre_save, sender=Parity)
@transaction.atomic
def prediction_results(sender, instance: Parity, **kwargs):
    # we want to update prediction results after the
    # parity for closing is saved

    base_eq = instance.base_equipment
    target_eq = instance.target_equipment
    date = instance.date
    ratio = instance.ratio
    previous_latest = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                              target_equipment=target_eq).first()

    closing_for_today = datetime.datetime.now().replace(hour=_DAY_CLOSING.hour,
                                                        minute=_DAY_CLOSING.minute,
                                                        tzinfo=datetime.timezone.utc)

    if (previous_latest.date <= closing_for_today) and (date >= closing_for_today):
        # Handling the prediction results

        predictions = Prediction.objects.filter(parity__base_equipment=base_eq,
                                                parity__target_equipment=target_eq,
                                                result=Prediction.PENDING)
        for pred in predictions:
            if (ratio < pred.parity.ratio) and (pred.direction == Prediction.WILL_DECREASE):
                pred.result = Prediction.SUCCESSFUL

            elif (ratio > pred.parity.ratio) and (pred.direction == Prediction.WILL_INCREASE):
                pred.result = Prediction.SUCCESSFUL

            else:
                pred.result = Prediction.FAILED

            pred.save()
