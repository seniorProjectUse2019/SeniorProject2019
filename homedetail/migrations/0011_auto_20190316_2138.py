# Generated by Django 2.1.7 on 2019-03-16 14:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('homedetail', '0010_auto_20190316_2136'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='data',
            options={'ordering': ['RoomId']},
        ),
    ]
