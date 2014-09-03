=======
Create Objective-C code from Tasty pie schema
=======


This project is no longer supported since a lot has changed and there are better products to do this
--------------------------------------------

The easiest way to get started is to look at the example.

At the moment related resources is not managed via the api.

Start by creating a resource:
```
class PollResource(ModelResource):
    id = fields.IntegerField(attribute='id', readonly=True)

    class Meta:
        resource_name = 'poll'
        queryset = Poll.objects.all()
        allowed_methods = ['get', 'post', 'put', 'delete']
        authorization = Authorization()
        authentication = ApiKeyAuthentication()
```

To generate the Objective-C code, run
```
pythhon manage.py create_api_client
```
a folder will be created called tastyphone_output.

Note: If you are using authentication on a resource, you need to provide a username and an api key,
using -u <username> -k <api key>, or tastyphone won't be able to read the schema.


* Every Resource that has a relationship, that allows updates, need to have blank=True
* Add libsqlite3.dylib to your xcode solution to be able to use the Sqlite credntial store


TODO
----
* Add support for more than api authentication
* Make it format agnostic (not just json)
* Add support for ARC
