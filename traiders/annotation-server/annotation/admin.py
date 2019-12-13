from django.contrib import admin

from .models import AnnotationTarget, AnnotationBody, FragmentSelector, Annotation

admin.site.register(AnnotationTarget)
admin.site.register(AnnotationBody)
admin.site.register(FragmentSelector)
admin.site.register(Annotation)
