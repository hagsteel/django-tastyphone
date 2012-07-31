import itertools
from tastyphone.formatters import Formatters
from tastyphone.type_handling.types import DataTypes

class Model(object):
    def __init__(self, name, schema):
        self.name = Formatters().pascal_case_format(name)
        fields = schema['fields']
        self.objects = [{'field_name':Formatters().camel_case_format(f),
                         'type':DataTypes().get_data_type(fields[f]['type']),
                         'original_name':f} for f in fields if fields[f]['type'] in DataTypes.objects]
        self.primitives = [{'field_name':Formatters().camel_case_format(f),'type':DataTypes().get_data_type(fields[f]['type'])} for f in fields if fields[f]['type'] in DataTypes.primitives]

    def __unicode__(self):
        return self.name

    def get_all_fields(self):
        lists = self.objects, self.primitives
        return itertools.chain(*lists)

    def get_class_name(self):
        return '%s.m' % self.name

    def get_header_name(self):
        return '%s.h' % self.name
