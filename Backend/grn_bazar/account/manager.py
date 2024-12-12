from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser

#  Custom User Manager


class UserManager(BaseUserManager):
    def create_user(self, email, first_name, last_name, phone_number, country, city, password=None, password2=None,is_farmer=None):
        """
        Creates and saves a User with the given email, name, tc and password.
        """
        if not email:
            raise ValueError('User must have an email address')

        user = self.model(
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            phone_number=phone_number,
            country=country,
            city=city,
            is_farmer=is_farmer
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, first_name, last_name, phone_number, country, city, password=None,is_farmer=None):
        """
        Creates and saves a superuser with the given email, name, tc and password.
        """
        user = self.create_user(
            email,
            password=password,
            first_name=first_name,
            last_name=last_name,
            phone_number=phone_number,
            country=country,
            city=city,
            is_farmer=is_farmer
        )
        user.is_admin = True
        user.save(using=self._db)
        return user
