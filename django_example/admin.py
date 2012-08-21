from django.contrib import admin
from tastypie.models import ApiAccess
from django_example.models import Poll, Choice, Question


class PollAdmin(admin.ModelAdmin):
    model = Poll

admin.site.register(Poll, PollAdmin)
admin.site.register(Question)
admin.site.register(Choice)
admin.site.register(ApiAccess)