import django_filters
from django.contrib.auth.models import User


class UserAddFilter(django_filters.FilterSet):

    class Meta:
        model = User
        fields = {
            'first_name': ['icontains'],
        }


UserAddFilter.base_filters['first_name__icontains'].label = 'Name'



