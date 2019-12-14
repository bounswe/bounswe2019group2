from django.db import models


class FragmentSelector(models.Model):
    type = 'FragmentSelector'
    # TODO conformsTo = 'http://www.w3.org/TR/media-frags/'
    value = models.CharField(max_length=64)


class AnnotationTarget(models.Model):
    source = models.URLField()
    selector = models.OneToOneField(FragmentSelector, on_delete=models.CASCADE)


class AnnotationBody(models.Model):
    TYPE_CHOICES = [
        ('TextualBody', 'TextualBody'),
        ('Image', 'Image'),
    ]

    type = models.CharField(max_length=32, choices=TYPE_CHOICES)
    value = models.CharField(max_length=512, null=True, blank=True)
    identifier = models.URLField(max_length=128, null=True, blank=True)


class Annotation(models.Model):
    context = 'http://www.w3.org/ns/anno.jsonld'
    target = models.OneToOneField(AnnotationTarget, on_delete=models.CASCADE)
    body = models.OneToOneField(AnnotationBody, on_delete=models.CASCADE)
    type = 'Annotation'
    created = models.DateTimeField(auto_now_add=True)

