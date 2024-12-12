# Generated by Django 4.2.4 on 2023-12-28 07:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0007_checkout'),
    ]

    operations = [
        migrations.CreateModel(
            name='PrintBill',
            fields=[
                ('checkout_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='shop.checkout')),
            ],
            bases=('shop.checkout',),
        ),
    ]