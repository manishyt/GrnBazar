
from django.urls import include, path
from account import views 


urlpatterns = [
    path('register/', views.UserRegistrationView.as_view(), name='register'),
    path('register/<str:email>/',
         views.UserRegistrationView.as_view(), name='register'),

    path('login/', views.UserLoginView.as_view(), name='login'),
    path('farmer_register/', views.FarmerRegistrationView.as_view(), name='farmer_register'),

]
