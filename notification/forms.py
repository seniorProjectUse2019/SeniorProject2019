from django import forms
from .models import SpecificNotification
from django.contrib.auth.models import User


class CreateNotificationForm(forms.ModelForm):

    class Meta:
        model = SpecificNotification
        fields = ['Topic', 'Detail', 'Date', 'Picture', 'Working_Hour', 'Pay']

