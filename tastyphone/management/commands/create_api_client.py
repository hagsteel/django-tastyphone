from optparse import make_option
from django.core.management.base import BaseCommand
from django.test.client import Client
from django.utils import simplejson
from tastyphone.class_renderer import ClassRenderer
from tastyphone.file_manager import FileManager
from tastyphone.models import Model


class Command(BaseCommand):
    args = '<stuffy...>'
    help = 'Hello, this is a help'

    option_list = BaseCommand.option_list + (
            make_option('--output', '-o', dest='output',
                help='Set the output directory'),
            make_option('--user', '-u', dest='username',
                help='Set the api username'),
            make_option('--apikey', '-k', dest='api_key',
                help='Set the api key'),
            make_option('--auth', '-a', dest='authentication',
                help='Set the tastypie authentication to use. Currently supported are: api and basic'),
            make_option('--company', '-c', dest='company_name',
                help='Set the company name, otherwise the copyright will be missing from the class headings'),
        )

    def __init__(self):
        super(Command, self).__init__()
        self.file_manager = FileManager()

    def handle(self, *args, **options):
        output = options.get('output')
        if output is None:
            print '==========='
            print 'ERROR:You have to specify an output directory'
            print '==========='
            return

        self.class_renderer = ClassRenderer(company_name=options.get('company_name'), authentication=options.get('authentication'))
        response = Client().get('/api/v1/?format=json')
        api_schema = simplejson.loads(response.content)
        print 'Schema loaded...'

        username = options.get('username')
        api_key = options.get('api_key')

        print 'Processing models'

        models = list()
        for k in api_schema:
            schema_url = api_schema[k][u'schema']
            endpoint = api_schema[k][u'list_endpoint']
            if username and api_key:
                schema_url = '%s?username=%s&api_key=%s' % (schema_url, username, api_key)
            r = Client().get(schema_url)

            try:
                if r.status_code == 401:
                    print ''
                    print '-------------------'
                    print 'WARNING!! Could not create models from %s' % endpoint
                    print 'supply user credentials using a username and a password or api key'
                    print '-u <username> -p <password> or -k <api key>'
                    print '-------------------'
                    print ''
                else:
                    schema = simplejson.loads(r.content)
                    model = Model(k, schema, endpoint)
                    models.append(model)

            except Exception as e:
                print e
                raise e

        for m in models:
            self.class_renderer.render_model(m)
            self.class_renderer.render_object_map(m)
            self.class_renderer.render_api_command(m)

        self.class_renderer.render_object_map_factory(models)
        self.class_renderer.render_static_files()
