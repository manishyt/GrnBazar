

from django.contrib import admin
from .models import Cart, Fruits,Vegetables , Grains, Fertilizers, DairyProducts, BaseProduct, Whitelist, BaseCartWhiteList, Checkout
from rest_framework import serializers

# Register your models here.


@admin.register(Fruits, Vegetables, Grains, Fertilizers, DairyProducts, BaseProduct)
class FruitsAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class BaseProductAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class VegetablesAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class GrainsAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class FertilizersAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class DairyProductsAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'quantity']


@admin.register(Whitelist)
class WhitelistAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'quantity']


@admin.register(BaseCartWhiteList)
class BaseCartWhiteListAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'quantity']


@admin.register(Checkout)
class CheckoutAdmin(admin.ModelAdmin):
    list_display = ['user', 'product', 'first_name', 'last_name', 'email', 'country', 'city',
                    'address', 'mobile_number', 'order_note', 'payment_method', 'total_bill', 'order_status']
