from django.db import models
from homedetail.models import Room, Data
from django.dispatch import receiver
from django.db.models.signals import post_save
from linebot import LineBotApi
from linebot.models import TextSendMessage
from linebot.exceptions import LineBotApiError

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


@receiver(post_save, sender=Data)
def auto_gen_notification(sender,**kwargs):
        SpecificNotification.objects.create(RoomID=kwargs.get('instance').RoomId, DataID=kwargs.get('instance'),
                                            topic='Utility Notification',
                                            detail='You have new Payment pending please'
                                                   ' go to detail page to Check for more detail',
                                            notification_type='u')


@receiver(post_save, sender=SpecificNotification)
def auto_gen_line_message(sender, **kwargs):

    line_bot_api = LineBotApi('nCTM0F9yupZHf2pKiM01XoZ+P6h+5WlldLdEAYz4ZeQm/EJHK6weQ3aFl8DxW7AkAhrL2F6PF8crtRh2OfMPc8Z8kf2PprOb+8aRrh0a8Wi1rFDOkI75lRyu3DxCB3uaiZM1cvKEwQlxu9iU7HHi5AdB04t89/1O/w1cDnyilFU=')

    try:
        line_bot_api.push_message('<to>', TextSendMessage(text='Hello World!'))
    except LineBotApiError as e:
        print(e)

