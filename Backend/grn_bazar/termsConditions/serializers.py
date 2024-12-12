from .models import TermsConditions
from rest_framework import serializers


class TermsConditionsSerializers(serializers.ModelSerializer):
    class Meta:
        model = TermsConditions
        fields = "__all__"
