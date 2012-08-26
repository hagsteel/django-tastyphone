import os
from setuptools import setup

# Utility function to read the README file.
# Used for the long_description.  It's nice, because now 1) we have a top level
# README file and 2) it's easier to type in the README file than to put a raw
# string in below ...
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(
    name = "django-tastyphone",
    version = "0.0.1",
    author = "Jonas Hagstedt",
    author_email = "hagstedt@gmail.com",
    description = ("Code gen tool for creating Objective C code from a django-tastypie api"),
    license = "BSD",
    keywords = "tastypie tastyphone iphone rest api",
    url = "",
    packages=['an_example_pypi_project', 'tests'],
    long_description=read('README.rst'),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Topic :: Utilities",
        "License :: OSI Approved :: BSD License",
    ],
)