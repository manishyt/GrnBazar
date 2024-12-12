from rest_framework import serializers
from account.models import User
from shop.serializers import CartSerializers, WhiteListSerializers


class UserRegistrationSerializer(serializers.ModelSerializer):
    # We are writing this becoz we need confirm password field in our Registratin Request
    password2 = serializers.CharField(
        style={'input_type': 'password'}, write_only=True)
    # cart_product = CartSerializers(many=True, read_only=True)
    # whitelist_product = WhiteListSerializers(many=True, read_only=True)

    class Meta:

        model = User
        fields = ['id', 'email', 'first_name', 'last_name', 'phone_number',
                  'country', 'city', 'password', 'password2']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    # Validating Password and Confirm Password while Registration
    def validate(self, attrs):
        password = attrs.get('password')
        password2 = attrs.get('password2')
        if password != password2:
            raise serializers.ValidationError(
                "Password and Confirm Password doesn't match")

        return attrs

    def create(self, validate_data):
        return User.objects.create_user(**validate_data)

    # def to_representation(self, instance):
    #     rep = super().to_representation(instance)
    #     cart_data = CartSerializers(instance.basecartwhitelist, many=True).data
    #     whitelist_data = WhiteListSerializers(
    #         instance.basecartwhitelist, many=True).data
    #     rep['cart_product'] = cart_data
    #     rep['whitelist_product'] = whitelist_data
    #     return rep


class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(max_length=255)

    class Meta:
        model = User
        fields = ['email', 'password']




class FarmerRegistrationSerializer(serializers.ModelSerializer):
    # We are writing this becoz we need confirm password field in our Registratin Request
    password2 = serializers.CharField(
        style={'input_type': 'password'}, write_only=True)
    # cart_product = CartSerializers(many=True, read_only=True)
    # whitelist_product = WhiteListSerializers(many=True, read_only=True)

    class Meta:

        model = User
        fields = ['id', 'email', 'first_name', 'last_name', 'phone_number',
                  'country', 'city', 'password', 'password2','is_farmer']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    # Validating Password and Confirm Password while Registration
    def validate(self, attrs):
        password = attrs.get('password')
        password2 = attrs.get('password2')
        if password != password2:
            raise serializers.ValidationError(
                "Password and Confirm Password doesn't match")

        return attrs

    def create(self, validate_data):
        return User.objects.create_user(**validate_data)
