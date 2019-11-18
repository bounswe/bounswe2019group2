from django.shortcuts import redirect
from django.http.response import Http404
from django.shortcuts import get_object_or_404

from ..models import User
from ..utils import EmailVerificationTokenGenerator


def verify_email(request, pk):
    user = get_object_or_404(User, pk=pk)
    token = request.GET.get('token', '')

    if not user.email_verified:
        token_generator = EmailVerificationTokenGenerator()

        if token_generator.check_token(user, token):
            user.email_verified = True
            user.save()
        else:
            raise Http404

    return redirect('https://traiders.tk/login')
