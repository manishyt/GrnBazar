

from django.urls import path, include
from refundPolicy.views import RefundView
urlpatterns = [
    path('refund/',RefundView.as_view()),


]
