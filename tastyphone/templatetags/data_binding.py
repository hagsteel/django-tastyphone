from django import template
from django.utils.encoding import force_unicode
from django.utils.safestring import mark_safe
from django.template.base import Node
import re

register = template.Library()


class FacelessNode(Node):
    def __init__(self, nodelist):
        self.nodelist = nodelist

    def render(self, context):
        return self.strip_spaces(self.nodelist.render(context).strip())

    def strip_spaces(self, value):
        glassa = value.split('\n')
        outlist = []
        for element in glassa:
            if element != u'' and element != u'\t':
                outlist.append(element.rstrip())

        out = '\n'.join(outlist)
        out = out.replace('}', '}\n')

        return force_unicode(out)


@register.filter(name='data_binding', needs_autoescape=False, is_safe=False)
def data_binding(field):
    if field['type'] == 'NSString':
        return mark_safe('[data objectForKey:@"%s"]' % field['original_name'])

    if field['type'] == 'NSInteger':
        return mark_safe('[[data objectForKey:@"%s"] intValue]' % field['original_name'])

    if field['type'] == 'NSDate':
        return mark_safe('[NSDate dateFromString:[data objectForKey:@"%s"]]' % field['original_name'])

        return mark_safe('[data objectForKey:@"%s"] // this might need attention' % field['original_name'])


@register.filter(name='writable_fields', needs_autoescape=False, is_safe=False)
def writable_fields(fields):
    return [f for f in fields if f['is_readonly'] == False]


@register.filter(name='to_nsstring', needs_autoescape=False, is_safe=False)
def to_nsstring(field, prefix=None):
    if prefix is not None:
        prefix = '%s.' % prefix
    else:
        prefix = ''

    if field['type'] == 'NSString':
        return mark_safe('%s%s' % (prefix, field['field_name']))

    if field['type'] == 'NSInteger':
        return mark_safe('[NSString stringWithFormat:@"%%d", %s%s]' % (prefix, field['field_name']))

    if field['type'] == 'NSDate':
        return mark_safe('[NSString stringWithFormat:@"%%@", [NSDate stringFromDate:%s%s]]' % (prefix, field['field_name']))

    return 'MISSING'


@register.tag(name='format_code')
def format_code(parser, token):
    nodelist = parser.parse(('endformat_code',))
    parser.delete_first_token()
    return FacelessNode(nodelist)
