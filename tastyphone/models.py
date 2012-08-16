import itertools
from tastyphone.formatters import Formatters
from tastyphone.type_handling.types import DataTypes

class Model(object):
    def __init__(self, name, schema, endpoint):
        self.endpoint = endpoint
        self.name = Formatters().pascal_case_format(name)
        fields = dict([(k,v) for k,v in schema['fields'].iteritems() if v['type'] != u'related'])

        self.objects = [{'field_name':self.format_safe_field_name(Formatters().camel_case_format(f)),
                         'type':DataTypes().get_data_type(fields[f]['type']),
                         'original_name':f,
                         'is_readonly':fields[f]['readonly']} for f in fields if fields[f]['type'] in DataTypes.objects]
        self.primitives = [{'field_name':self.format_safe_field_name(Formatters().camel_case_format(f)),
                            'type':DataTypes().get_data_type(fields[f]['type']),
                            'original_name':f,
                            'is_readonly':fields[f]['readonly']} for f in fields if fields[f]['type'] in DataTypes.primitives]

        self.allowed_detailed_http_methods = schema['allowed_detail_http_methods']
        self.allowed_list_http_methods = schema['allowed_list_http_methods']

    def __unicode__(self):
        return self.name

    def get_all_fields(self):
        lists = self.objects, self.primitives
        return itertools.chain(*lists)

    def get_class_name(self):
        return '%s.m' % self.name

    def get_header_name(self):
        return '%s.h' % self.name

    def format_safe_field_name(self,name):
        if name == 'id':
            return '%sId' % self.name
        return name
