

from .models import Cart, Fruits,Vegetables , Grains, Fertilizers, DairyProducts, BaseProduct, Whitelist, BaseCartWhiteList, Checkout
from rest_framework import serializers


class BaseProductSerializers(serializers.ModelSerializer):
    class Meta:
        model = BaseProduct
        fields = [ 'name','price','image'  ,'description']


class FruitsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Fruits
        fields = "__all__"


class VegetablesSerializers(serializers.ModelSerializer):
    class Meta:
        model = Vegetables
        fields = "__all__"


class GrainsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Grains
        fields = "__all__"


class FertilizersSerializers(serializers.ModelSerializer):
    class Meta:
        model = Fertilizers
        fields = "__all__"


class DairyProductsSerializers(serializers.ModelSerializer):
    class Meta:
        model = DairyProducts
        fields = "__all__"


class CartSerializers(serializers.ModelSerializer):
    product_details = BaseProductSerializers(read_only=True)

    class Meta:
        model = Cart
        fields = ['id', 'user', 'product', 'quantity', 'product_details']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        product_data = BaseProductSerializers(instance.product).data
        representation['product_details'] = product_data
        return representation


class WhiteListSerializers(serializers.ModelSerializer):
    product_details = BaseProductSerializers(read_only=True)

    class Meta:
        model = Whitelist
        fields = ['id', 'user', 'product', 'quantity', 'product_details']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        product_data = BaseProductSerializers(instance.product).data
        representation['product_details'] = product_data
        return representation


class BaseCartWhitelistSerializers(serializers.ModelSerializer):
    class Meta:
        model = BaseCartWhiteList
        fields = "__all__"


class CheckoutSerializers(serializers.ModelSerializer):
    product_details = BaseProductSerializers(read_only=True)

    class Meta:
        model = Checkout
        fields = ['id', 'user', 'product', 'first_name', 'last_name', 'email', 'country',
                  'city', 'address', 'mobile_number', 'order_note', 'payment_method', 'total_bill', 'order_status', 'product_details']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        product_data = BaseProductSerializers(instance.product).data
        representation['product_details'] = product_data
        return representation


class ViewProductSerializers(serializers.ModelSerializer):
    class Meta:
        model = BaseProduct
        fields = "__all__"
