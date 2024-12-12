

from django.urls import path, include
from termsConditions.views import TermsConditionsView
urlpatterns = [
    path('terms/',TermsConditionsView.as_view()),


]
