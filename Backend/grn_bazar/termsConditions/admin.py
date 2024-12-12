from django.contrib import admin

# Register your models here.
from .models import TermsConditions


@admin.register(TermsConditions)
class TermsConditionsAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'description']
