from django.conf.urls import patterns, include, url
from tastypie.api import Api
from django_example.api.resources import PollResource, QuestionResource, VoteResource

api = Api(api_name='v1')
api.register(PollResource())
api.register(QuestionResource())
api.register(VoteResource())

urlpatterns = patterns('',
  url('^', include(api.urls)),
)
