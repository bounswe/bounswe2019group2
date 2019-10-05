from django.contrib.auth.models import BaseUserManager


class UserManager(BaseUserManager):
    def create_user(self, email, username, password, user_role=1):
        if not email:
            raise ValueError("Enter an e-mail.")
        if not username:
            raise ValueError("Enter a username.")
        if not password:
            raise ValueError("Enter a password.")

        user = self.model(
            email=self.normalize_email(email),
            username=username,
            user_role=user_role)
        user.set_password(password)
        print(email, username,password)
        user.save()
        return user

    def create_superuser(self, email, username, password):
        user = self.create_user(email, username, password, user_role=3)
        user.user_role = 3
        user.is_superuser = True
        user.is_staff = True
        user.save()
        return user
