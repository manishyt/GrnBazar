from django.contrib import admin

# Register your models here.
from .models import About


@admin.register(About)
class AboutAdmin(admin.ModelAdmin):
    list_display = [
        'id', 'title', 'description'
    ]
