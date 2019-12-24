import logging
from django.dispatch.dispatcher import receiver
from django.urls import reverse
from django.db.models.signals import post_save, pre_save
from django.db import transaction
from ..models import Article, Alert, Following, Parity, Event, Notification, Equipment

logger = logging.getLogger(__name__)


@receiver(post_save, sender=Article)
@transaction.atomic
def article_post(sender, instance: Article, **kwargs):
    author = instance.author
    followers = Following.objects.filter(user_followed=author, status=Following.ACCEPTED)
    pk = instance.pk
    url = reverse('article-detail', kwargs={'pk': pk})

    for follower in followers:
        Notification.objects.create(user=follower.user_following,
                                    message=author.first_name + " " + author.last_name + " has written an article.",
                                    reference_obj="Article",
                                    reference_url=url)


@receiver(pre_save, sender=Event)
@transaction.atomic
def event_happening(sender, instance: Event, **kwargs):
    pk = instance.pk
    prev_event = Event.objects.filter(pk=pk).first()
    if prev_event is None:
        return
    prev_value = prev_event.actual
    current_value = instance.actual
    url = reverse('event-detail', kwargs={'pk': pk})
    if current_value is not prev_value:
        followers = instance.followed_by.all()
        for follower in followers:
            Notification.objects.create(user=follower,
                                        message="There are news and updates about the event you have followed.",
                                        reference_obj="Event",
                                        reference_url=url)


@receiver(post_save, sender=Parity)
@transaction.atomic
def parity_change(sender, instance: Parity, created, **kwargs):
    base_symbol = instance.base_equipment.symbol
    target_symbol = instance.target_equipment.symbol
    ratio = instance.close

    t1 = Alert.objects.filter(base_symbol=base_symbol, target_symbol=target_symbol, ratio__gte=ratio,
                              increasing=False)

    t2 = Alert.objects.filter(base_symbol=base_symbol, target_symbol=target_symbol, ratio__lte=ratio,
                              increasing=True)

    parity = (
        Parity.objects.order_by('-date').filter(target_equipment__symbol=target_symbol,
                                                base_equipment__symbol=base_symbol).first()
    )

    parity_url = reverse('parity-detail', kwargs={'pk': parity.pk})

    for alert in t1:
        Notification.objects.create(user=alert.user,
                                    message="Alert: the parity " + base_symbol + "/" + target_symbol + " has reached the value you set.",
                                    reference_obj="ParityAlert",
                                    reference_url=parity_url)
        alert.delete()

    for alert in t2:
        Notification.objects.create(user=alert.user,
                                    message="Alert: the parity " + base_symbol + "/" + target_symbol + " has reached the value you set.",
                                    reference_obj="ParityAlert",
                                    reference_url=parity_url)
        alert.delete()
