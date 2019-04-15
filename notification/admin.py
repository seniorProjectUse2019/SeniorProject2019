from django.contrib import admin
from notification.models import SpecificNotification, GlobalNotificaiton
# Register your models here.


@admin.register(GlobalNotificaiton)
class GlobalNotificationAdmin(admin.ModelAdmin):
    list_display = ('Topic', 'Detail', 'notification_type')


@admin.register(SpecificNotification)
class SpecificNotificationAdmin(admin.ModelAdmin):
    list_display = ('RoomID', 'topic', 'detail', 'notification_type')

