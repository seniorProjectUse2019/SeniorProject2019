from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from datetime import date

import uuid  # Required for unique instances

# Create your models here.


def get_first_name(self):
    return self.first_name


User.add_to_class("__str__", get_first_name)


class Room(models.Model):
    """Model representing a room(i.e. that is i the condominium)."""
    RoomId = models.UUIDField(primary_key=True, default=uuid.uuid4, help_text='Unique room id')
    RoomNumber = models.CharField(max_length=200, help_text='enter your room number here')
    RoomDetail = models.TextField(max_length=1000, help_text='Enter a brief description of the room', null=True)
    UserID = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, help_text="Room owner of the room")

    ROOM_STATUS = (
        ('m', 'Maintenance'),
        ('o', 'Occupied'),
        ('a', 'Available'),
    )

    status = models.CharField(
        max_length=1,
        choices=ROOM_STATUS,
        blank=True,
        default='a',
        help_text='Room Status',
    )

    def display_owner_firstname(self):
        """Create a string for the Payment Method. This is required to display pament method in Admin."""
        return self.UserID.first_name

    display_owner_firstname.short_description = 'Room Owner'

    def get_absolute_url(self):
        """Returns the url to access a particular room instance."""
        return reverse('room-detail', args=[str(self.RoomId)])

    class Meta:
        # permissions = (("can_mark_returned", "Set book as returned"),)
        ordering = ['RoomNumber']

    def __str__(self):
        """String for representing the Model object."""
        return str(self.RoomNumber)


class UserInTheRoom(models.Model):
    User = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, help_text="Someone in the Room")
    RoomId = models.ForeignKey(Room, on_delete=models.SET_NULL, null=True)
    USER_STATUS = (
        ('O', 'Owner'),
        ('T', 'Tenant'),
    )

    status = models.CharField(
        max_length=1,
        choices=USER_STATUS,
        blank=True,
        default='T',
        help_text='User Status',
    )


class DataType(models.Model):
    """Model representing a rate of the datatype"""
    DataType_Name = models.CharField(max_length=200, help_text='enter your Data Type')
    DataTypeDetail = models.TextField(max_length=1000, help_text='Enter a brief description of the data Type')
    Rate = models.DecimalField(max_digits= 10, decimal_places=2, default=None)

    def get_rate(self):
        return self.Rate

    def get_name_type(self):
        return str(self.DataType_Name)

    def __str__(self):
        """String for representing the Model object."""
        return str(self.DataType_Name)


class Data(models.Model):
    """Model representing a data used in the room"""
    RoomId = models.ForeignKey('Room', on_delete=models.SET_NULL, null=True)
    Data_Type = models.ForeignKey('DataType', on_delete=models.SET_NULL, null=True,
                                  help_text='Select a type for this data')
    DataDate = models.DateField(null=True, blank=True)
    DataDeadLine = models.DateField(null=True, blank=True)
    Detail = models.TextField(max_length=1000, blank=True, null=True, help_text='Enter a brief description of the data')
    UnitUsed = models.DecimalField(max_digits=10, decimal_places=2, default=None)
    DATA_STATUS = (
        ('P', 'Paid'),
        ('O', 'On Process'),
        ('N', 'Not Paid'),

    )

    status = models.CharField(
        max_length=1,
        choices=DATA_STATUS,
        blank=True,
        default='N',
        help_text='Room Status',
    )

    def get_absolute_url(self):
        """Returns the url to access a particular author instance."""
        return reverse('data-detail', args=[str(self.id)])

    def __str__(self):
        """String for representing the Model Object"""
        return str(self.id)

    def is_overdue(self):
        if self.DataDeadLine and date.today() > self.DataDeadLine:
            return True
        return False

    def amount_used(self):
        rate = self.Data_Type.get_rate()
        amount = self.UnitUsed*rate
        return amount

    class Meta:
        # permissions = (("can_mark_returned", "Set book as returned"),)
        ordering = ['RoomId']




