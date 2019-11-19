from django.utils.crypto import salted_hmac


class EmailVerificationTokenGenerator:
    key_salt = 'api.utils.EmailVerificationTokenGenerator'

    def make_token(self, user):
        return salted_hmac(self.key_salt, str(user.pk)).hexdigest()

    def check_token(self, user, token):
        return self.make_token(user) == token
