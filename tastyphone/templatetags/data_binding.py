from django import template
from django.template.context import Context
from django.utils.safestring import mark_safe

register = template.Library()

@register.filter(name='data_binding',needs_autoescape=False,is_safe=False)
def data_binding(field):
    if field['type'] == 'NSString':
        return mark_safe('[data objectForKey:@"%s"]' % field['original_name'])

    if field['type'] == 'NSInteger':
        return mark_safe('[[data objectForKey:@"%s"] intValue]' % field['original_name'])

    if field['type'] == 'NSDate':
        return mark_safe('[NSDate dateFromString:[data objectForKey:@"%s"]]' % field['original_name'])

    return '-'