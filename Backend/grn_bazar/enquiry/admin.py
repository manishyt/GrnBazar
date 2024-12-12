from django.contrib import admin
from .models import Enquiry
# Register your models here.


@admin.register(Enquiry)
class EnquiryAdmin(admin.ModelAdmin):
    list_display = ['id', 'first_name', 'last_name', 'email', 'message']
