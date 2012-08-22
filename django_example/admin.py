from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from tastypie.models import ApiAccess
from django_example.models import Poll, Choice, Question

UserAdmin.list_display += ('api_key',)


class QuestionInlinesAdmin(admin.StackedInline):
    model = Question


class ChoiceInlinesAdmin(admin.StackedInline):
    model = Choice


class PollAdmin(admin.ModelAdmin):
    model = Poll
    inlines = [QuestionInlinesAdmin, ]


class QuestionAdmin(admin.ModelAdmin):
    model = Question
    inlines = [ChoiceInlinesAdmin, ]


admin.site.register(Poll, PollAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Choice)
