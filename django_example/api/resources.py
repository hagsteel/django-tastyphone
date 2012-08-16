from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from django_example.models import Poll, Question, Vote


class PollResource(ModelResource):
    class Meta:
        resource_name = 'poll'
        queryset = Poll.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()


class QuestionResource(ModelResource):
    class Meta:
        resource_name = 'question'
        queryset = Question.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()


class VoteResource(ModelResource):
    class Meta:
        resource_name = 'vote'
        queryset = Vote.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
