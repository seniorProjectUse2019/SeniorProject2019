from django.urls import path
from . import views

urlpatterns = [
    path('<int:pk>', views.invoice_create, name='invoice-create'),
    path('show/invoice', views.show_invoice, name='show-invoice')
]
