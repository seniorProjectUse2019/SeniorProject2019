from django import forms
from homedetail.models import UserInTheRoom, Room
from django.contrib.auth.models import User
from django.forms import HiddenInput


class UserAddForm(forms.ModelForm):

    class Meta:
        model = UserInTheRoom
        fields = ['RoomId']
        widgets = {
            'User': forms.HiddenInput(),
            'RoomId': forms.HiddenInput(),
        }

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', '')
        super(UserAddForm, self).__init__(*args, **kwargs)
        self.fields['User'] = forms.ModelChoiceField(queryset=User.objects.all(), widget=forms.HiddenInput())
        self.fields['RoomId'] = forms.ModelChoiceField(queryset=Room.objects.filter(UserID=user), widget=forms.HiddenInput())


class UserNameForm(forms.ModelForm):

    class Meta:
        model = Room
        fields = ['RoomNumber', 'RoomDetail', 'UserID', 'status']
        exclude = ['RoomId']

    def __init__(self, *args, **kwargs):
        super(UserNameForm, self).__init__(*args, **kwargs)

