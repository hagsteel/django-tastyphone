import os

class FileManager(object):

    _model_dir = 'models'
    _object_maps_dir = 'object_maps'
    _api_commands_dir = 'api_commands'
    _root_dir = 'tastyphone_output'
    _helpers_dir = 'helpers'

    def get_filename(self, directory, filename):
        return os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir, directory, filename))

    def write_file_to_disk(self, directory, file_name, data):
        if file_name.rfind('.txt') > 0:
            file_name = file_name[0:file_name.rfind('.txt')]
        f = open(self.get_filename(self.get_or_create_directory(directory), file_name), 'w')
        f.writelines(data)

    def format_filename(self, file_name):
        return file_name.title().replace('_','')

    def get_or_create_directory(self, dir):
        dir = os.path.join(os.path.dirname(__file__), os.path.join(self._root_dir, dir))
        if not os.path.exists(dir):
            os.makedirs(dir)
        return dir

    def get_models_dir(self):
        return self.get_or_create_directory(self._model_dir)

    def get_object_maps_dir(self):
        return self.get_or_create_directory(self._object_maps_dir)

    def get_api_command_dir(self):
        return self.get_or_create_directory(self._api_commands_dir)

    def get_helpers_dir(self):
        return self.get_or_create_directory(self._helpers_dir)