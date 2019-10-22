from django.shortcuts import redirect
from django.http.response import Http404

from ..models import MobileApp


def latest_mobile_app(request):
    latest_app: MobileApp = MobileApp.objects.order_by('-updated_at').first()

    if not latest_app:
        raise Http404

    return redirect(latest_app.apk_file.url)
