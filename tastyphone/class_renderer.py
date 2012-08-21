from django.template.context import Context
from django.template.loader import get_template
import os
from tastyphone.file_manager import FileManager
from django.utils.datetime_safe import datetime


class ClassRenderer(object):

    def __init__(self, company_name=None, authentication=None):
        self.company_name = company_name
        self.authentication = authentication
        self.file_manager = FileManager()
        pass

    def add_default_context(self, context):
        context['company_name'] = self.company_name
        context['date_day'] = datetime.now().day
        context['date_month'] = datetime.now().month
        context['date_year'] = datetime.now().year
        return context

    def render_model(self, model):
        context = Context({'model_name': model.name,
                     'objects': model.objects,
                     'primitives': model.primitives,
        })

        context = self.add_default_context(context)
        class_template = get_template('class_scaffolding/model.m.txt')
        context['file_name'] = model.get_class_name()
        class_model_data = class_template.render(context)

        class_header_template = get_template('class_scaffolding/model.h.txt')
        context['file_name'] = model.get_header_name()
        class_header_data = class_header_template.render(context)

        self.file_manager.write_file_to_disk(self.file_manager.get_models_dir(), model.get_class_name(), class_model_data)
        self.file_manager.write_file_to_disk(self.file_manager.get_models_dir(), model.get_header_name(), class_header_data)

    def render_object_map_factory(self, models):
        context = Context({'model_maps': ['%sMap' % m.name for m in models], 'models': [m.name for m in models]})
        context = self.add_default_context(context)

        class_template = get_template('class_scaffolding/object_mapper_factory.m.txt')
        context['file_name'] = 'ObjectMapperFactory.m'
        class_model_data = class_template.render(context)

        class_template_header = get_template('class_scaffolding/object_mapper_factory.h.txt')
        context['file_name'] = 'ObjectMapperFactory.h'
        class_header_data = class_template_header.render(context)

        object_map_protocol_template = get_template('class_scaffolding/object_map_protocol.h.txt')
        context['file_name'] = 'ObjectMapProtocol.h'
        object_map_protocol_data = object_map_protocol_template.render(context)

        self.file_manager.write_file_to_disk(self.file_manager.get_object_maps_dir(), 'ObjectMapperFactory.m', class_model_data)
        self.file_manager.write_file_to_disk(self.file_manager.get_object_maps_dir(), 'ObjectMapperFactory.h', class_header_data)
        self.file_manager.write_file_to_disk(self.file_manager.get_object_maps_dir(), 'ObjectMapProtocol.h', object_map_protocol_data)

    def render_object_map(self, model):
        map_name = '%sMap' % model.name
        context = Context({'map_name': map_name,
                           'model_name': model.name,
                           'objects': model.objects,
                           'primitives': model.primitives})
        context = self.add_default_context(context)

        object_map_template = get_template('class_scaffolding/object_map.m.txt')
        object_map_data = object_map_template.render(context)
        self.file_manager.write_file_to_disk(self.file_manager.get_object_maps_dir(), '%s.m' % map_name, object_map_data)

        object_map_template = get_template('class_scaffolding/object_map.h.txt')
        object_map_data = object_map_template.render(context)
        self.file_manager.write_file_to_disk(self.file_manager.get_object_maps_dir(), '%s.h' % map_name, object_map_data)

    def render_api_command(self, model):
        context = Context({'model_name': model.name,
                           'instance_name': 'a%s' % model.name,
                           'objects': model.objects,
                           'allowed_list_methods': model.allowed_list_http_methods,
                           'allowed_detailed_methods': model.allowed_detailed_http_methods,
                           'filters': model.filters,
                           'endpoint': model.endpoint,
                           'primitives': model.primitives})
        context = self.add_default_context(context)

        command_template = get_template('class_scaffolding/api_command.m.txt')
        command_data = command_template.render(context)
        self.file_manager.write_file_to_disk(self.file_manager.get_api_command_dir(), '%sCommand.m' % model.name, command_data)

        command_template = get_template('class_scaffolding/api_command.h.txt')
        command_data = command_template.render(context)
        self.file_manager.write_file_to_disk(self.file_manager.get_api_command_dir(), '%sCommand.h' % model.name, command_data)

    def render_static_files(self, parent='static', file=None):
        path = os.path.join(os.path.dirname(__file__), 'templates', parent)
        files = os.listdir(path)

        for f in files:
            if os.path.isfile(os.path.join(path, f)):
                self.render_static_file(parent, f)
            else:
                self.render_static_files(os.path.join(parent, f))

    def render_static_file(self, path, file):
        context = Context({'authentication': self.authentication})
        context = self.add_default_context(context)
        template = get_template(os.path.join(path, file))
        data = template.render(context)
        self.file_manager.write_file_to_disk(path.split('static/')[1], file, data)
