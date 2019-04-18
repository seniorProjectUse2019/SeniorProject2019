from django.contrib import admin
from django import forms
from django.contrib import admin
from django.contrib.admin.sites import site
from django.contrib.admin.widgets import ManyToManyRawIdWidget, ForeignKeyRawIdWidget
from django.urls import reverse
from django.utils.encoding import smart_text
from django.utils.html import escape
# Register your models here.

from homedetail.models import Room, DataType, Data, UserInTheRoom
from django.contrib.auth.models import User
from .forms import UserNameForm


class VerboseForeignKeyRawIdWidget(ForeignKeyRawIdWidget):
    def label_for_value(self, value):
        key = self.rel.get_related_field().name
        try:
            obj = self.rel.to._default_manager.using(self.db).get(**{key: value})
            change_url = reverse(
                "admin:%s_%s_change" % (obj._meta.app_label, obj._meta.object_name.lower()),
                args=(obj.pk,)
            )
            return '&nbsp;<strong><a href="%s">%s</a></strong>' % (change_url, escape(obj))
        except (ValueError, self.rel.to.DoesNotExist):
            return '???'


class VerboseManyToManyRawIdWidget(ManyToManyRawIdWidget):
    def label_for_value(self, value):
        values = value.split(',')
        str_values = []
        key = self.rel.get_related_field().name
        for v in values:
            try:
                obj = self.rel.to._default_manager.using(self.db).get(**{key: v})
                x = smart_text(obj)
                change_url = reverse(
                    "admin:%s_%s_change" % (obj._meta.app_label, obj._meta.object_name.lower()),
                    args=(obj.pk,)
                )
                str_values += ['<strong><a href="%s">%s</a></strong>' % (change_url, escape(x))]
            except self.rel.to.DoesNotExist:
                str_values += [u'???']
        return u', '.join(str_values)


class ImproveRawIdFieldsForm(admin.ModelAdmin):
    def formfield_for_dbfield(self, db_field, **kwargs):
        if db_field.name in self.raw_id_fields:
            kwargs.pop("request", None)
            type = db_field.rel.__class__.__name__
            if type == "ManyToOneRel":
                kwargs['widget'] = VerboseForeignKeyRawIdWidget(db_field.rel, site)
            elif type == "ManyToManyRel":
                kwargs['widget'] = VerboseManyToManyRawIdWidget(db_field.rel, site)
            return db_field.formfield(**kwargs)
        return super(ImproveRawIdFieldsForm, self).formfield_for_dbfield(db_field, **kwargs)


@admin.register(Room)
class RoomAdmin(admin.ModelAdmin):
    list_display = ('RoomNumber', 'RoomDetail', 'display_owner_firstname', 'status')
    raw_id_fields = ('UserID',)

    def get_form(self, request, obj=None, **kwargs):  # no change to original change user display in model
        return UserNameForm


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


