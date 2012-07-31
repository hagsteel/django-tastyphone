from django.template.context import Context
from django.template.loader import get_template
from tastyphone.formatters import Formatters
from tastyphone.type_handling.types import DataTypes

class ModelParser(object):

    def __init__(self):
        pass

    def get_model_context(self, json_model, model_name):
#        print json.simplejson.dumps(json_model, indent=4)

        fields = json_model['fields']
        objects = [{'field_name':Formatters().camel_case_format(f),'type':self.get_data_type(fields[f]['type'])} for f in fields if fields[f]['type'] in DataTypes.objects]
        primitives = [{'field_name':Formatters().camel_case_format(f),'type':self.get_data_type(fields[f]['type'])} for f in fields if fields[f]['type'] in DataTypes.primitives]

        c = Context({'model_name':model_name,
                     'field_names':[Formatters().camel_case_format(f) for f in fields],
                     'objects':objects,
                     'primitives':primitives,
        })

        return c

    def format_field_name(self, field_name, field_data):
        field_name = Formatters().camel_case_format(field_name)
        field = '@property (nonatomic, %(reference_type)s) %(data_type)s %(pointer_marker)s%(field_name)s' % {'field_name':field_name,
                                                                                                              'reference_type':self.get_retain_type(field_data['type']),
                                                                                                              'pointer_marker':self.get_pointer_marker(field_data['type']),
                                                                                                              'data_type':self.get_data_type(field_data['type'])}
        return field

    def get_data_type(self,type):
        return DataTypes.type_map[type]

    def get_retain_type(self, type):
        if type in DataTypes.primitives:
            return 'assign'
        return 'retain'

    def get_pointer_marker(self, type):
        if type in DataTypes.primitives:
            return ''
        return '*'

