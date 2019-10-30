from rest_framework.viewsets import ReadOnlyModelViewSet, GenericViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins, status
from rest_framework.response import Response
from django.urls import reverse

from ..models import Event
from ..serializers import EventSerializer
from ..filters import EventFilterSet


class EventViewSet(ReadOnlyModelViewSet):
    serializer_class = EventSerializer
    queryset = Event.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = EventFilterSet


class EventFollowViewSet(mixins.ListModelMixin,
                         mixins.RetrieveModelMixin,
                         mixins.UpdateModelMixin,
                         mixins.DestroyModelMixin,
                         GenericViewSet):
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = EventFilterSet

    def list(self, request, *args, **kwargs):
        return Response({
            'followers': 'You cannot perform this action.'
        }, status=status.HTTP_400_BAD_REQUEST)

    def update(self, request, *args, **kwargs):
        user = request.user
        instance = super().get_object()
        if user in instance.followed_by.all():
            return Response({
                'event': 'You already follow this event.'
            }, status=status.HTTP_400_BAD_REQUEST)
        instance.followed_by.add(user)
        serializer = super().get_serializer(instance)
        return Response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        user = request.user
        instance = self.get_object()
        if user not in instance.followed_by.all():
            return Response({
                'event': 'You are not following this event, hence you cannot unfollow.'
            }, status=status.HTTP_400_BAD_REQUEST)
        instance.followed_by.remove(user)
        serializer = super().get_serializer(instance)
        return Response(serializer.data)

