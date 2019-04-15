from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import SpecificNotification
from homedetail.models import Room, Data, UserInTheRoom
from django.contrib.auth.models import User

from linebot import LineBotApi, WebhookParser
from linebot.exceptions import InvalidSignatureError, LineBotApiError
from linebot.models import MessageEvent, TextMessage, TextSendMessage


@receiver(post_save, sender=Data)
def auto_gen_notification(sender,**kwargs):
        data_insert = kwargs.get('instance')
        data_type = data_insert.Data_Type.get_name_type()
        print(data_type)
        amount = data_insert.amount_used()
        detail = 'You have new payment pending Payment detail' + '\n'
        detail += 'Data type of the payment: ' + data_type + '\n' + 'amount: ' + str(amount)
        detail += 'please go to Data page to check for detail'
        SpecificNotification.objects.create(RoomID=kwargs.get('instance').RoomId, DataID=kwargs.get('instance'),
                                            topic='Utility Notification',
                                            detail=detail,
                                            notification_type='u')


@receiver(post_save, sender=SpecificNotification)
def auto_gen_line_message(sender, **kwargs):
    line_bot_api = LineBotApi(settings.LINE_CHANNEL_ACCESS_TOKEN)
    parser = WebhookParser(settings.LINE_CHANNEL_SECRET)
    to = kwargs.get('instance').RoomID
    user_send = UserInTheRoom.objects.filter(RoomId=to).values('User')  # .User_set.values('username')
    list_result = [entry for entry in user_send]
    list_to = []
    message = kwargs.get('instance').detail
    for item in list_result:
        for key in item:
            user = User.objects.filter(id=item[key]).values('username').get()
            list_to.append(user['username'])
    try:
        for item in list_to:
            line_bot_api.push_message(item, TextSendMessage(text=str(message)))
    except LineBotApiError as e:
        print(e)

