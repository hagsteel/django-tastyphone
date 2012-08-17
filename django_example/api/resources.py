from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from django_example.models import Poll, Question, Choice


class PollResource(ModelResource):
    class Meta:
        resource_name = 'poll'
        queryset = Poll.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()


class QuestionResource(ModelResource):
    poll = fields.RelatedField(PollResource, 'poll')

    class Meta:
        resource_name = 'question'
        queryset = Question.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
        filtering = {
            'poll': ('exact'),
        }


class ChoiceResource(ModelResource):
    class Meta:
        resource_name = 'choice'
        queryset = Choice.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
