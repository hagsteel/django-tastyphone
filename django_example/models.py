from django.db import models


class Poll(models.Model):
    title = models.CharField(max_length=254, null=False)

    def __unicode__(self):
        return self.title


class Question(models.Model):
    question = models.CharField(max_length=254, null=False)
    poll = models.ForeignKey(Poll, related_name='polls')

    def __unicode__(self):
        return self.question


class Choice(models.Model):
    date_created = models.DateTimeField(auto_now=True)
    question = models.ForeignKey(Question, related_name='choices')
    description = models.CharField(max_length=30)
    count = models.IntegerField(default=0)

    def __unicode__(self):
        return self.description
