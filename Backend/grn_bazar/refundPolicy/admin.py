from django.contrib import admin
from .models import Refund
# Register your models here.


@admin.register(Refund)
class RefundAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'description']
