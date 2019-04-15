from django.db import models
from homedetail.models import Room, Data


# Create your models here.


class GlobalNotificaiton(models.Model):
    """Model representing a notification that aims to send to everyone"""
    Topic = models.CharField(max_length=200, help_text='Enter The Topic of the notification')
    Detail = models.TextField(max_length=1000, help_text='Enter a brief description of the notification')
    NOTIFICATION_TYPE = (
        ('u', 'Utility'),
        ('o', 'other'),
        ('a', 'announcement'),
    )

    notification_type = models.CharField(
        max_length=1,
        choices=NOTIFICATION_TYPE,
        blank=True,
        default='a',
        help_text='Room Status',
    )

    def __str__(self):
        """String for representing the Model Object."""
        return str(self.id)


class SpecificNotification(models.Model):
    """Model representing a notification"""
    RoomID = models.ForeignKey(Room, on_delete=models.SET_NULL, null=True, blank=True)
    DataID = models.ForeignKey(Data, on_delete=models.SET_NULL, blank=True, null=True)
    topic = models.CharField(max_length=200, help_text='Enter data type')
    detail = models.TextField(max_length=1000, help_text='Enter a brief description of the notification')
    NOTIFICATION_TYPE = (
        ('u', 'Utility'),
        ('o', 'other'),
        ('a', 'announcement'),
    )

    notification_type = models.CharField(
        max_length=1,
        choices=NOTIFICATION_TYPE,
        blank=True,
        default='a',
        help_text='Room Status',
    )

    def __str__(self):
        """String for representing the Model Object."""
        return str(self.id)




