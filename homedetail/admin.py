from django.contrib import admin

# Register your models here.

from homedetail.models import Room, DataType, Data, UserInTheRoom


@admin.register(Room)
class RoomAdmin(admin.ModelAdmin):
    list_display = ('RoomNumber', 'RoomDetail', 'display_owner', 'status')


@admin.register(DataType)
class DataTypeAdmin(admin.ModelAdmin):
    list_display = ('id', 'DataType_Name', 'DataTypeDetail', 'Rate')
    list_editable = ['Rate']


@admin.register(Data)
class DataAdmin(admin.ModelAdmin):
    list_display = ('id', 'RoomId', 'Data_Type', 'DataDate', 'DataDeadLine', 'Detail', 'status')
    list_filter = ('Data_Type', 'DataDate', 'RoomId')


@admin.register(UserInTheRoom)
class UserInTheRoomAdmin(admin.ModelAdmin):
    list_display = ('User', 'RoomId')


