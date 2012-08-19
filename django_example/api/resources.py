from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from django_example.models import Poll, Question, Choice


class PollResource(ModelResource):
    id = fields.IntegerField(attribute='id', readonly=True)

    class Meta:
        resource_name = 'poll'
        queryset = Poll.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()


class QuestionResource(ModelResource):
    poll = fields.RelatedField(PollResource, 'poll', blank=True)
    id = fields.IntegerField(attribute='id', readonly=True)
    poll_id = fields.IntegerField(attribute='poll_id')

    class Meta:
        resource_name = 'question'
        queryset = Question.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
        filtering = {
            'poll': ('exact'),
        }


class ChoiceResource(ModelResource):
    question = fields.RelatedField(QuestionResource, 'question', blank=True)
    date_created = fields.DateTimeField(attribute='date_created', readonly=True)
    id = fields.IntegerField(attribute='id', readonly=True)
    question_id = fields.IntegerField(attribute='question_id')

    class Meta:
        resource_name = 'choice'
        queryset = Choice.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
        filtering = {
            'question': ('exact'),
        }
