from django.template.context import Context
from django.template.loader import get_template
import os
from tastyphone.file_manager import FileManager
from tastyphone.parsers.model_parser import ModelParser
from django.utils.datetime_safe import datetime

class ClassRenderer(object):

    def __init__(self, company_name=None):
        self.company_name = company_name
        self.file_manager = FileManager()
        pass

    def add_default_context(self,context):
        context['company_name'] = self.company_name
        context['date_day'] = datetime.now().day
        context['date_month'] = datetime.now().month
        context['date_year'] = datetime.now().year
        return context

    def render_model(self, model):
        context = Context({'model_name':model.name,
                     'objects':model.objects,
                     'primitives':model.primitives,
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
        context = Context({'model_headers':[m.get_header_name() for m in models], 'models':[m.name for m in models]})
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
        context = Context({'header_file_name':'%s.h' % map_name,
                           'model_name':model.name,
                           'objects':model.objects,
                           'primitives':model.primitives})
        context = self.add_default_context(context)

        object_map_template = get_template('class_scaffolding/object_map.m.txt')
        object_map_data = object_map_template.render(context)
        self.file_manager.write_file_to_disk(self.file_manager.get_object_maps_dir(), '%s.m' % map_name, object_map_data)

    def render_api_commands(self):
        pass