# Generated by Django 2.0.13 on 2019-04-16 05:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homedetail', '0019_remove_data_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='room',
            name='RoomDetail',
            field=models.TextField(help_text='Enter a brief description of the room', max_length=1000, null=True),
        ),
    ]
