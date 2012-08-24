from django.conf.urls import url
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.db.utils import IntegrityError
from tastypie import fields
from tastypie.authentication import BasicAuthentication, ApiKeyAuthentication
from tastypie.authorization import Authorization
from tastypie.exceptions import BadRequest
from tastypie.resources import ModelResource
from tastypie.utils.urls import trailing_slash
from tastypie.validation import FormValidation
from django_example.forms import RegistrationForm
from django_example.models import Poll, Question, Choice


class SignInResource(ModelResource):
    class Meta:
        resource_name = 'signin'
        queryset = User.objects.all()
        detail_allowed_methods = ['get']
        list_allowed_methods = ['get']
        always_return_data = True
        authorization = Authorization()
        limit = 20
        filtering = {
            'username': ('exact'),
            'password': ('exact'),
        }
        fields = ('username', 'password', 'api_key')

    def dehydrate(self, bundle):
        bundle.data['api_key'] = bundle.obj.api_key.key
        return bundle


class RegistrationResource(ModelResource):
    id = fields.IntegerField(attribute='id', readonly=True)
    api_key = fields.CharField(readonly=True)

    class Meta:
        resource_name = 'registration'
        queryset = User.objects.all()
        allowed_methods = ['post']
        always_return_data = True
        authorization = Authorization()
        validation = FormValidation(form_class=RegistrationForm)

        filtering = {
            'username': ('exact'),
            'password': ('exact'),
        }
        fields = ('username', 'id', 'api_key', 'password')

    def dehydrate(self, bundle):
        bundle.data['api_key'] = bundle.obj.api_key.key
        return bundle

    def obj_create(self, bundle, request=None, **kwargs):
        try:
            bundle = super(RegistrationResource, self).obj_create(bundle, request, **kwargs)
            bundle.obj.set_password(bundle.data.get('password'))
            bundle.obj.save()
        except IntegrityError:
            raise BadRequest('That username already exists')
        return bundle


#class UserResource(ModelResource):
#    class Meta:
#        queryset = User.objects.all()
#        list_allowed_methods = ['get', 'post']
#
#    def prepend_urls(self):
#        return [
#            url(r"^(?P<resource_name>%s)/signin%s$" % (self._meta.resource_name, trailing_slash()), self.wrap_view('signin'), name="api_signin"),
#        ]
#
#    def signin(self, request, **kwargs):
#        self.method_check(request, allowed=['post'])
#
#        # Per https://docs.djangoproject.com/en/1.3/topics/auth/#django.contrib.auth.login...
#        username = request.POST['username']
#        password = request.POST['password']
#        user = authenticate(username=username, password=password)
#
#        if user is not None:
#            if user.is_active:
#                login(request, user)
#                return self.create_response(request, {'success': True})
#            else:
#                # Return a 'disabled account' error message
#                return self.create_response(request, {'success': False})
#        else:
#            # Return an 'invalid login' error message.
#            return self.create_response(request, {'success': False})


class PollResource(ModelResource):
    id = fields.IntegerField(attribute='id', readonly=True)

    class Meta:
        resource_name = 'poll'
        queryset = Poll.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
        authentication = ApiKeyAuthentication()  # BasicAuthentication()


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
