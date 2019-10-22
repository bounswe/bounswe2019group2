from django.db import models
from django.utils import timezone
from ..models import *


class ArticleComment(models.Model):
    article = models.ForeignKey(Article, on_delete=models.CASCADE, blank=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    created_at = models.DateTimeField(default=timezone.now)
    content = models.TextField(blank=True, max_length=400)
    image = models.ImageField(blank=True)


class EquipmentComment(models.Model):
    equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE, blank=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    created_at = models.DateTimeField(default=timezone.now)
    content = models.TextField(blank=True, max_length=200)
    image = models.ImageField(blank=True)
