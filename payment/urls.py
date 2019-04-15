from django.urls import path
from . import views

urlpatterns = [
    path('payment/<int:pk>', views.invoice_create, name='invoice-create'),

]