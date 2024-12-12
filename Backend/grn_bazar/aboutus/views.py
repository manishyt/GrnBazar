from django.shortcuts import render
from .models import About
from .serializers import AboutSerializer
from rest_framework.generics import ListAPIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly
# Create your views here.


class AboutView(ListAPIView):
    queryset = About.objects.all()
    serializer_class = AboutSerializer
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticatedOrReadOnly]
