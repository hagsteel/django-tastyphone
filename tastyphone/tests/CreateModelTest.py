from django.core import management
from django.test import TestCase


class CreateModelTest(TestCase):

    def test_create_model(self):
        management.call_command('create_models')
