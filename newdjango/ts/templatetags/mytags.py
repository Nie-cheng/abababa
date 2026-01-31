from django import template
from django.db.models import Count
from django.db.models.functions import TruncMonth

from ts import models

register = template.Library()

@register.inclusion_tag('left_menu.html')
def left_menu(username):
    user_obj = models.User.objects.filter(username=username).first()
    blog = user_obj.blog
    category_list = (models.Category.objects.filter(is_delete=False, blog=blog)
                     .annotate(count_num=Count('article__id')).values_list('name', 'count_num', 'id'))

    tag_list = (models.Tag.objects.filter(is_delete=False, blog=blog)
                .annotate(count_num=Count('article__id')).values_list('name', 'count_num', 'id'))

    date_list = (
        models.Article.objects.filter(is_delete=False, blog=blog).annotate(mouth=TruncMonth('create_time')).values(
            'mouth').annotate(count_num=Count('id')).values_list('mouth', 'count_num'))
    return locals()