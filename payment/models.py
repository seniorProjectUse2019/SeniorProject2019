from django.db import models
from django.contrib.auth.models import User
from homedetail.models import Data, DataType, Room
import uuid  # Required for unique book instances

# Create your models here.


class PaymentType(models.Model):
    PaymentTypeDetail = models.CharField(max_length=1000, help_text='Detail of the payment method')

    def __str__(self):
        """String for representing the Model object."""
        return str(self.PaymentTypeDetail)


class Invoice(models.Model):
    """Model representing an invoice"""
    PayerID = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    Data = models.ForeignKey(Data, on_delete=models.SET_NULL, null=True, help_text='order Data')
    Rate = models.ForeignKey(DataType, on_delete=models.SET_NULL, null=True)
    quantity = models.PositiveIntegerField()
    Created_date = models.DateTimeField(auto_now_add=True)
    Evidence = models.ImageField(upload_to='evidences/', null=True)
    Payment_method = models.ManyToManyField(PaymentType, help_text='Select a method for this payment')

    def get_total_cost(self):
        return self.Rate.Rate * self.quantity

    def display_payment(self):
        """Create a string for the Payment Method. This is required to display pament method in Admin."""
        return ', '.join(Payment_method.PaymentTypeDetail for Payment_method in self.Payment_method.all())

    display_payment.short_description = 'Payment Method'

    def __str__(self):
        """String for representing the Model object."""
        return str(self.id)


