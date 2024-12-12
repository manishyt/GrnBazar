from rest_framework import serializers
from .models import Refund


class RefundSerializers(serializers.ModelSerializer):
    class Meta:
        model = Refund
        fields = '__all__'
