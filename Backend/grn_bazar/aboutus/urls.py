

from django.urls import path, include
from aboutus.views import AboutView
urlpatterns = [
    path('about/', AboutView.as_view()),


]
