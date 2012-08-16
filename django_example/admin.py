from django.contrib import admin
from django_example.models import Poll, Choice, Question


class PollAdmin(admin.ModelAdmin):
    model = Poll

admin.site.register(Poll, PollAdmin)
admin.site.register(Question)
admin.site.register(Choice)
