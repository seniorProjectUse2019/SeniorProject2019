# Generated by Django 2.1.7 on 2019-03-20 07:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homedetail', '0011_auto_20190316_2138'),
    ]

    operations = [
        migrations.AlterField(
            model_name='data',
            name='status',
            field=models.CharField(blank=True, choices=[('P', 'Paid'), ('O', 'On Process'), ('N', 'Not Paid')], default='N', help_text='Room Status', max_length=1),
        ),
    ]
