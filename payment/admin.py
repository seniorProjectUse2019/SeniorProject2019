from django.contrib import admin

# Register your models here.

from payment.models import Invoice, PaymentType


@admin.register(Invoice)
class InvoiceAdmin(admin.ModelAdmin):
    list_display = ('PayerID', 'Data', 'Rate', 'quantity', 'Created_date', 'Evidence', 'display_payment')
    list_filter = ['Created_date', 'PayerID']


@admin.register(PaymentType)
class PaymentTypeAdmin(admin.ModelAdmin):
    pass


