from django.shortcuts import render
from .models import Refund
from .serializers import RefundSerializers
from rest_framework.generics import ListAPIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
# Create your views here.


class RefundView(ListAPIView):
    queryset = Refund.objects.all()
    serializer_class = RefundSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticatedOrReadOnly]
