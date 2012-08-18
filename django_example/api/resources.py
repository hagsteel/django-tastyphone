from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.resources import ModelResource
from django_example.models import Poll, Question, Choice


class PollResource(ModelResource):
#    questions = fields.ManyToManyField('django_example.api.resources.QuestionResource','questions')

    class Meta:
        resource_name = 'poll'
        queryset = Poll.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()


class QuestionResource(ModelResource):
#    choices = fields.ManyToManyField('django_example.api.resources.ChoiceResource','choices')

    poll = fields.RelatedField(PollResource, 'poll', blank=True)

    class Meta:
        resource_name = 'question'
        queryset = Question.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
        filtering = {
            'poll': ('exact'),
        }

#    def obj_update(self, bundle, request=None, **kwargs):
#        super(QuestionResource,self).obj_update(bundle, request, **kwargs)


class ChoiceResource(ModelResource):
    question = fields.RelatedField(QuestionResource, 'question', blank=True)

    class Meta:
        resource_name = 'choice'
        queryset = Choice.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
        filtering = {
            'question': ('exact'),
        }

