from django.contrib.auth.models import User
from django.db import models
from tastypie.models import create_api_key

models.signals.post_save.connect(create_api_key, sender=User)


class Poll(models.Model):
    title = models.CharField(max_length=254, null=False)

    def __unicode__(self):
        return self.title


class Question(models.Model):
    question = models.CharField(max_length=254)
    poll = models.ForeignKey(Poll, related_name='questions')

    def __unicode__(self):
#        import ipdb; ipdb.set_trace()
        return '%(q)s: %(a)s' % ({'q': self.question, 'a': '\n'.join([c.description_with_result for c in self.choices.all()])})


class Choice(models.Model):
    date_created = models.DateTimeField(auto_now=True, editable=False)
    question = models.ForeignKey(Question, related_name='choices')
    description = models.CharField(max_length=30)
    count = models.IntegerField(default=0, editable=False)

    def __unicode__(self):
        return self.description

    @property
    def description_with_result(self):
        return '%s - %s' % (self.description, self.count)
