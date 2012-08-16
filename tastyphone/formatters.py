class Formatters(object):
    def pascal_case_format(self, name):
        return name.title().replace('_','')

    def camel_case_format(self, name):
        name = name.title().replace('_','')
        name = name[0].lower() + name[1:]
        return name
