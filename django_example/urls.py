from django.conf.urls import patterns, include, url
from django_example.api.urls import api

urlpatterns = patterns('',
    url(r'^api/', include(api.urls))
)
