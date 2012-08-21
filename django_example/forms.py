from django import forms
from django.contrib.auth.models import User


class RegistrationForm(forms.Form):
    username = forms.CharField(max_length=2)

    class Meta:
        model = User

    def is_valid(self):
        if User.objects.filter(username=self.data['username']).count():
            self._errors['username'] = 'there is already a user with this name'
        return super(RegistrationForm, self).is_valid()
