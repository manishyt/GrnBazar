# Generated by Django 5.1.3 on 2024-12-06 08:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='is_farmer',
            field=models.BooleanField(default=False),
        ),
    ]
