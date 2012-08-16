class DataTypes(object):
    primitives = ('integer', 'float', 'decimal', 'boolean')
    objects = ('string', 'list', 'dict', 'date', 'datetime', 'related', 'time')
    type_map = {'string': 'NSString',
                'integer': 'NSInteger',
                'boolean': 'BOOL',
                'datetime': 'NSDate',
                'dict': 'NSMutableDictionary',
                'time': 'NSDate',
                'related': 'NSObject'}

    def get_data_type(self, type):
        return DataTypes.type_map[type]

    def get_retain_type(self, type):
        if type in DataTypes.primitives:
            return 'assign'
        return 'retain'

    def get_pointer_marker(self, type):
        if type in DataTypes.primitives:
            return ''
        return '*'
