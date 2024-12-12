from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from account.serializers import UserLoginSerializer, UserRegistrationSerializer, FarmerRegistrationSerializer
from django.contrib.auth import authenticate
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from .models import User


class UserRegistrationView(APIView):
    def post(self, request, format=None):
        serializer = UserRegistrationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({'msg': 'Registration Successful'}, status=status.HTTP_201_CREATED)

    def get(self, request, email=None, format=None):
        try:
            user = User.objects.get(email=email)
            serializer = UserRegistrationSerializer(user)
            return Response(serializer.data)
        except User.DoesNotExist:
            return Response({"error": f"User with email {email} does not exist"}, status=404)
    def patch(self, request, email=None, format=None):
        try:
            user = User.objects.get(email=email)  # Find the user by email
            serializer = UserRegistrationSerializer(user, data=request.data, partial=True)  # `partial=True` allows partial updates
            serializer.is_valid(raise_exception=True)  # Validate incoming data
            serializer.save()  # Save the updates
            return Response({"msg": "User updated successfully", "data": serializer.data}, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response({"error": f"User with email {email} does not exist"}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


class UserLoginView(APIView):

    def post(self, request, format=None):
        serializer = UserLoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        email = serializer.data.get('email')
        password = serializer.data.get('password')
        user = authenticate(email=email, password=password)
        if user is not None:
            token, created = Token.objects.get_or_create(user=user)

            return Response({"token": token.key, 'msg': 'Login Success'}, status=status.HTTP_200_OK)
        else:
            return Response({'errors': {'non_field_errors': ['Email or Password is not Valid']}}, status=status.HTTP_404_NOT_FOUND)


class FarmerRegistrationView(APIView):
    def post(self, request, format=None):
        serializer = FarmerRegistrationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({'msg': 'Registration Successful'}, status=status.HTTP_201_CREATED)

    def get(self, request, email=None, format=None):
        try:
            user = User.objects.get(email=email)
            serializer = FarmerRegistrationSerializer(user)
            return Response(serializer.data)
        except User.DoesNotExist:
            return Response({"error": f"User with email {email} does not exist"}, status=404)