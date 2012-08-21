from django import forms
from django.contrib.auth.models import User


class RegistrationForm(forms.Form):
    class Meta:
        model = User

    def is_valid(self):
        if User.objects.filter(username=self.data['username']).count():
            if 'username' in self._errors:
                self._errors.update('username', 'there is already a user with this name')
            else:
                self._errors['username'] = 'there is already a user with this name'
        if self.data['password'] is None:
            self._errors['password'] = 'you have to enter a password'
        return super(RegistrationForm, self).is_valid()
