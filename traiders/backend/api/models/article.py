from django.db import models
from django.utils import timezone
from .users import User


class Article(models.Model):
    # TODO decide maximum lengths for title and content

    author = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    title = models.CharField(max_length=200, blank=False)
    created_at = models.DateTimeField(default=timezone.now)
    content = models.TextField(blank=False, max_length=10000)
    # TODO how to store images?
    image_url = models.ImageField(blank=True, null=True, verbose_name="Add an image on your article")
