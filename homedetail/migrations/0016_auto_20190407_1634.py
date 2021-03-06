# Generated by Django 2.1.7 on 2019-04-07 09:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('homedetail', '0015_auto_20190402_2257'),
    ]

    operations = [
        migrations.AddField(
            model_name='userintheroom',
            name='status',
            field=models.CharField(blank=True, choices=[('O', 'Owner'), ('T', 'Tenant')], default='O', help_text='User Status', max_length=1),
        ),
        migrations.AlterField(
            model_name='userintheroom',
            name='RoomId',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='homedetail.Room'),
        ),
    ]
