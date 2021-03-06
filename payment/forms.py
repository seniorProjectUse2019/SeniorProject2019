from django import forms
from .models import Invoice, PaymentType, Room
from django.contrib.auth.models import User
from django.forms import HiddenInput


class OrderCreateForm(forms.ModelForm):
    # Evidence = forms.ImageField()
    # Payment_method = forms.ModelChoiceField(queryset=PaymentType.objects.all())
    # PayerId = forms.ModelChoiceField(queryset=User.objects.all(), widget=forms.HiddenInput())

    class Meta:
        model = Invoice
        fields = ['Evidence', 'Payment_method']

    def __init__(self, *args, **kwargs):
        super(OrderCreateForm, self).__init__(*args, **kwargs)
        self.fields['Payment_method'] = forms.ModelChoiceField(queryset=PaymentType.objects.all())



