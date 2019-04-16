"""
Django settings for Condo project.

Generated by 'django-admin startproject' using Django 2.1.7.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

import os
import django_heroku
import dj_database_url
from decouple import config

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '8ihps+4sx)i+5%&@-swwm^g^ldb!vz^58da)3df0w$loz*9k#k'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'homedetail.apps.HomedetailConfig',
    'notification.apps.NotificationConfig',
    'payment.apps.PaymentConfig',
    'social_django',  # social media app after installing via pip install social-auth-app-django
    'django_filters',

]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'social_django.middleware.SocialAuthExceptionMiddleware',  # connect to social media
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

ROOT_URLCONF = 'Condo.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.media',
                'social_django.context_processors.backends',  # For social media login
                'social_django.context_processors.login_redirect',  # social media login
            ],
        },
    },
]

WSGI_APPLICATION = 'Condo.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases
DATABASES = {
    'default': dj_database_url.config(default=config('DATABASE_URL')),
               'OPTIONS': {
                   'timeout': 99999999,
                   'net_read_timeout': 9999999
            },
}


# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

AUTHENTICATION_BACKENDS = (
    'social_core.backends.line.LineOAuth2',  # for Line app(more app add below)

    'django.contrib.auth.backends.ModelBackend',
)

# Social Auth pipeline
SOCIAL_AUTH_PIPELINE = (
    # Get the information we can about the user and return it in a simple
    # format to create the user instance later. On some cases the details are
    # already part of the auth response from the provider, but sometimes this
    # could hit a provider API.
    'social_core.pipeline.social_auth.social_details',

    # Get the social uid from whichever service we're authing thru. The uid is
    # the unique identifier of the given user in the provider.
    'social_core.pipeline.social_auth.social_uid',

    # Verifies that the current auth process is valid within the current
    # project, this is where emails and domains whitelists are applied (if
    # defined).
    'social_core.pipeline.social_auth.auth_allowed',

    # Checks if the current social-account is already associated in the site.
    'social_core.pipeline.social_auth.social_user',

    # Make up a username for this person, appends a random string at the end if
    # there's any collision.
    'social_core.pipeline.user.get_username',

    # Send a validation email to the user to verify its email address.
    # Disabled by default.
    # 'social_core.pipeline.mail.mail_validation',

    # Associates the current social details with another user account with
    # a similar email address. Disabled by default.
    # 'social_core.pipeline.social_auth.associate_by_email',

    # Create a user account if we haven't found one yet.
    'social_core.pipeline.user.create_user',

    # Create the record that associates the social account with the user.
    'social_core.pipeline.social_auth.associate_user',

    # Populate the extra_data field in the social record with the values
    # specified by settings (and the default ones like access_token, etc).
    'social_core.pipeline.social_auth.load_extra_data',

    # Update the user record with any changed info from the auth service.
    'social_core.pipeline.user.user_details',
)

# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Bangkok'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Secret key for the login process
SOCIAL_AUTH_LINE_KEY = '1558380235'
SOCIAL_AUTH_LINE_SECRET = '5391b5d467c64c5dc82a5e254b2e78b8'


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
STATIC_ROOT = os.path.join(PROJECT_ROOT, "static")
STATIC_URL = '/static/'

STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# Redirect to home URL after login (Default redirects to /homedetail/)
LOGIN_URL = 'login'  # redirect url in case the user is not LOGIN yet
LOGOUT_URL = 'logout'
SOCIAL_AUTH_LOGIN_REDIRECT_URL = '/homedetail'
LOGIN_REDIRECT_URL = '/homedetail'

# For picture
MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'media')
MEDIA_URL = "/media/"

# for social network login
SOCIAL_AUTH_LINE_SCOPE = [
    'profile',
    'openid',
    'email',
]

# for line chat bot
LINE_CHANNEL_ACCESS_TOKEN = 'nCTM0F9yupZHf2pKiM01XoZ+P6h+5WlldLdEAYz4ZeQm/EJHK6weQ3aFl8DxW7AkAhrL2F6PF8crtRh2OfMPc8Z8kf2PprOb+8aRrh0a8Wi1rFDOkI75lRyu3DxCB3uaiZM1cvKEwQlxu9iU7HHi5AdB04t89/1O/w1cDnyilFU='
LINE_CHANNEL_SECRET = '7bd07016ab58dc882f778a4bc7d0006c'


django_heroku.settings(locals())
del DATABASES['default']['OPTIONS']['sslmode']  # remove when sent to heroku
