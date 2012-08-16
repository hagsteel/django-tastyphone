from django.db import models

class Poll(models.Model):
    title = models.CharField(max_length=254, null=False)

class Question(models.Model):
    question = models.CharField(max_length=254, null=False)
    poll = models.ForeignKey(Poll, related_name='polls')

class Vote(models.Model):
    date_created = models.DateTimeField(auto_now=True)
    question = models.ForeignKey(Question, related_name='questions')

