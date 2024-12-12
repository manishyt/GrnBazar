from django.shortcuts import render
from .serializers import *
from .models import *
from rest_framework import viewsets
from rest_framework.authentication import SessionAuthentication
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from rest_framework.generics import ListCreateAPIView
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
# Create your views here.


from django.views.decorators.csrf import csrf_exempt


class BaseProductView(ListCreateAPIView):
    queryset = BaseProduct.objects.all()
    serializer_class = BaseProductSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]

# menscloths
class FruitsView(ListCreateAPIView):
    queryset = Fruits.objects.all()
    serializer_class = FruitsSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]

#mensshoes
class VegetablesView(ListCreateAPIView):
    queryset = Vegetables.objects.all()
    serializer_class = VegetablesSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


#mensWatchsView
class GrainsView(ListCreateAPIView):
    queryset = Grains.objects.all()
    serializer_class = GrainsSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


#WomensHandbagsView
class FertilizersView(ListCreateAPIView):
    queryset = Fertilizers.objects.all()
    serializer_class = FertilizersSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]

#WomenGlasses
class DairyProductsView(ListCreateAPIView):
    queryset = DairyProducts.objects.all()
    serializer_class = DairyProductsSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


class BeseCartWhitelistView(ListCreateAPIView):
    queryset = BaseCartWhiteList.objects.all()
    serializer_class = BaseCartWhitelistSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user = self.request.user
        return Whitelist.objects.filter(user=user)


class CartView(ListCreateAPIView):
    queryset = Cart.objects.all()
    serializer_class = CartSerializers
    # filter_backends = [SearchFilter]
    # filterset_fields = ['user']

    def get_queryset(self):
        user_id = self.request.query_params.get('id')
        if user_id:
            return Cart.objects.filter(user=user_id)


class WhiteListView(ListCreateAPIView):
    queryset = Whitelist.objects.all()
    serializer_class = WhiteListSerializers
    # authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user_id = self.request.query_params.get('id')
        if user_id:
            return Whitelist.objects.filter(user=user_id)


class CheckOutView(ListCreateAPIView):
    queryset = Checkout.objects.all()
    serializer_class = CheckoutSerializers
    # authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user_id = self.request.query_params.get('id')
        if user_id:
            return Checkout.objects.filter(user=user_id)




class ViewOwnProductFarmer(APIView):
   
    def get(self, request, format=None):
        obj = BaseProduct.objects.all()
        serializer_class = BaseProductSerializers(obj,many=True)
        return Response(serializer_class.data, status=status.HTTP_200_OK)

    
