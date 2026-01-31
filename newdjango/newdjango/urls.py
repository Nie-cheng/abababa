"""
URL configuration for newdjango project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,re_path,include

from newdjango import settings
from ts import views
from django.views.static import serve

urlpatterns = [
    re_path('media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}),  # 头像
    path('admin/', admin.site.urls),
    path('register/', views.register),
    path('login/', views.login),
    path('get_code/', views.get_code),
    path('home/', views.home),
    path('logout/',views.logout),
    path('set_password/',views.set_password),
    path('backend/',views.backend),
    path('add_article/',views.add_article),
    path('add_category/',views.add_category),
    path('add_tag/',views.add_tag),
    path('comment/',views.comment),
    path('up_or_down/',views.up_or_down),
    path('set_avatar/',views.set_avatar),
    #用户信息修改
    path('user/edit/',views.user_edit,name='user_edit'),
    re_path('comment/delete/(?P<comment_id>\d+)', views.comment_delete, name='comment_delete'),
    re_path('tag/delete/(?P<tag_id>\d+)', views.tag_delete, name='tag_delete'),
    re_path('tag/edit/(?P<tag_id>\d+)',views.tag_edit,name='tag_edit'),
    re_path('category/delete/(?P<category_id>\d+)',views.category_delete,name='category_delete'),
    re_path('category/edit/(?P<category_id>\d+)',views.category_edit,name='category_edit'),
    #文章删除
    re_path('article/delete/(?P<article_id>\d+)/',views.article_delete,name='article_delete'),
    #文章编辑
    re_path('article/edit/(?P<article_id>\d+)', views.article_edit,name='article_edit'),
    #左侧路由
    re_path('(?P<username>\w+)/(?P<condition>category|tag|archive)/(?P<param>.*)',views.site),

    #文章详情
    re_path('(?P<username>\w+)/p/(?P<article_id>\d+)',views.article_detail),
    #个人站点
    re_path('(?P<username>\w+)', views.site),

]
