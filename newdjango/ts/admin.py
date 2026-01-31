from django.contrib import admin
from ts import models
# Register your models here.
admin.site.register(models.User)
admin.site.register(models.Blog)
admin.site.register(models.Tag)
admin.site.register(models.Category)
admin.site.register(models.Article)