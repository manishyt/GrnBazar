from django.shortcuts import render
from .models import TermsConditions
from .serializers import TermsConditionsSerializers
from rest_framework.generics import ListAPIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
# Create your views here.


class TermsConditionsView(ListAPIView):
    queryset = TermsConditions.objects.all()
    serializer_class = TermsConditionsSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticatedOrReadOnly]
