from optparse import make_option
from django.core.management.base import BaseCommand
from django.test.client import Client
from django.utils import simplejson
from tastyphone.class_renderer import ClassRenderer
from tastyphone.file_manager import FileManager
from tastyphone.formatters import Formatters
from tastyphone.models import Model

class Command(BaseCommand):
    args = '<stuffy...>'
    help = 'Hello, this is a help'

    option_list = BaseCommand.option_list + (
            make_option('--user', '-u', dest='username',
                help='Set the api username'),
            make_option('--apikey', '-k', dest='api_key',
                help='Set the api key'),
            make_option('--company', '-c', dest='company_name',
                help='Set the company name, otherwise the copyright will be missing from the class headings'),
        )

    def __init__(self):
        super(Command,self).__init__()
        self.class_renderer = ClassRenderer()
        self.file_manager = FileManager()


    def handle(self, *args, **options):
        response = Client().get('/api/v1/?format=json')
        api_schema = simplejson.loads(response.content)
        print 'Schema loaded...'

        username = options.get('username')
        api_key = options.get('api_key')

        print 'Processing models'
        print 'hacking in some user credentials, remove these'
        username = 'test1'
        api_key = 'd769efc32fca6a742bcae9f7eaffc5f7b389e728'

        models = list()
        for k in api_schema:
            schema_url = api_schema[k][u'schema']
            if username and api_key:
                schema_url = '%s?username=%s&api_key=%s' % (schema_url, username, api_key)
            r = Client().get(schema_url)

            try:
                schema = simplejson.loads(r.content)
                model = Model(k, schema)
                models.append(model)

#                model_classes = self.class_renderer.render_models(schema, model_name)
#                self.file_manager.write_file_to_disk(self.file_manager.get_models_dir(), model_name + '.m', model_classes['class'])
#                self.file_manager.write_file_to_disk(self.file_manager.get_models_dir(), model_name + '.h', model_classes['header'])

            except Exception as e:
                print e
                raise e

        for m in models:
            self.class_renderer.render_model(m)
            self.class_renderer.render_object_map(m)

        object_factory_classes = self.class_renderer.render_object_map_factory(models)
#
#        maps = self.class_renderer.render_object_maps()