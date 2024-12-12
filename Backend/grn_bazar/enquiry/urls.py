from django.urls import path, include
from enquiry.views import EnquiryView
urlpatterns = [
    path('enquiry/',EnquiryView.as_view()),


]
