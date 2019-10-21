from django.db import models


class MobileApp(models.Model):
    apk_file = models.FileField(blank=False)
    updated_at = models.DateTimeField(auto_now=True)
    version = models.CharField(blank=True, max_length=32)
