import os
from django.core.management.base import BaseCommand

class Command(BaseCommand):
    def handle(self, *args, **options):
        from os.path import abspath, dirname
        import sys
        import manage
        a = os.path.dirname(os.path.realpath(manage.__file__))
        c = sys.path.insert(0, dirname(dirname(abspath(__file__))))
        b = os.path.abspath(os.path.dirname(__file__))
        print a
        print '---'
        print b