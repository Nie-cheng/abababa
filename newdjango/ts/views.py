import json
import os
import random
import re
from io import BytesIO

from django.contrib import auth
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect

from newdjango import settings
from ts import regform, models
from PIL import Image, ImageDraw, ImageFont
from django.contrib.auth.decorators import login_required
from django.db.models import Count, F
from bs4 import BeautifulSoup
from django.db.models.functions import TruncMonth



# Create your views here.
def register(request):
    form_obj = regform.RegForm()
    if request.method == 'POST':
        back_dict={'code':0,'msg':''}
        form_obj = regform.RegForm(request.POST)
        if form_obj.is_valid():
            clean_data = form_obj.cleaned_data
            avatar = request.FILES.get('avatar')
            clean_data.pop('password2')
            if avatar:
                clean_data['avatar'] = avatar
            back_dict['url'] = '/login'
            username = clean_data.get('username')
            blog_obj = models.Blog.objects.create(site_name=username)
            models.User.objects.create_user(**clean_data,blog=blog_obj)
        else:
            back_dict['code'] = 2000
            back_dict['msg'] = form_obj.errors
        return JsonResponse(back_dict)
    return render(request, 'register.html',locals())

def get_color():
    return random.randint(0, 255),random.randint(0, 255),random.randint(0, 255)
def get_code(request):
    img_obj = Image.new('RGB',(480,35),get_color())
    img_draw = ImageDraw.Draw(img_obj)
    # font_path = os.path.join(settings.BASE_DIR, 'static', 'font', '111.ttf')
    # img_font = ImageFont.truetype(font_path,30)
    img_font = ImageFont.truetype('./static/font/111.ttf',30)
    code = ''
    for i in range(5):
        random_upper = chr(random.randint(65,90))
        random_lower = chr(random.randint(97, 122))
        random_int = str(random.randint(0,9))
        tem = random.choice([random_lower, random_upper, random_int])
        img_draw.text(((i+1)*90, 0), tem, get_color(), font=img_font)
        code += tem
    request.session['code'] = code
    io_obj = BytesIO()
    img_obj.save(io_obj,'png')
    data = io_obj.getvalue()
    return HttpResponse(data)

def login(request):
    if request.method == 'POST':
        back_dict={'code':0,'msg':''}
        username = request.POST.get('username')
        password = request.POST.get('password')
        code = request.POST.get('code')
        #忽略大小写
        if code.upper() == request.session.get('code').upper():
            user_obj = auth.authenticate(request,username=username,password=password)
            if user_obj:
                auth.login(request,user_obj)#存入session
                target_url = request.GET.get('next')
                if target_url:
                    back_dict['url'] = target_url
                else:
                    back_dict['url'] = '/home/'
            else:
                back_dict['code'] = 2000
                back_dict['msg'] = '用户名或密码错误'
        else:
            back_dict['code'] = 3000
            back_dict['msg'] = '验证码错误'
        return JsonResponse(back_dict)

    return render(request, 'login.html')

def home(request):
    return render(request, 'home.html')

def set_password(request):
    if request.method == 'POST':
        back_dict={'code':0,'msg':''}
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        re_password = request.POST.get('re_password')
        if new_password == re_password:
            is_right = request.user.check_password(old_password)
            if is_right:
                request.user.set_password(new_password)
                request.user.save()
                back_dict['msg']='修改成功'
            else:
                back_dict['code'] = 1002
                back_dict['msg'] = '旧密码错误'
        else:
            back_dict['code'] = 1001
            back_dict['msg'] = '两次密码不一致'
        return JsonResponse(back_dict)

@login_required
def logout(request):
    auth.logout(request)
    return redirect('/home/')

def home(request):
    article_queryset = models.Article.objects.filter(is_delete=False)
    return render(request, 'home.html', locals())

def site(request,username,**kwargs):
    user_obj = models.User.objects.filter(username=username).first()
    if not user_obj: return render(request, 'error.html')
    blog = user_obj.blog
    article_list = models.Article.objects.filter(is_delete=False,blog = blog)

    if kwargs:
        condition = kwargs.get('condition')
        param = kwargs.get('param')
        if condition == 'category':
            article_list = article_list.filter(category_id = param)
        elif condition == 'tag':
            article_list = article_list.filter(tag__id = param)
        else:
            year , month = param.split('-')
            article_list = article_list.filter(create_time__year=year,create_time__month=month)

    return render(request, 'site.html',locals())

def article_detail(request,username,article_id):
    user_obj = models.User.objects.filter(username=username).first()
    if not user_obj:
        return render(request, 'error.html')
    blog = user_obj.blog
    article_obj = models.Article.objects.filter(blog=blog,id=article_id,is_delete=False).first()
    comment_list = models.Comment.objects.filter(article=article_obj)
    return render(request, 'article_detail.html',locals())

def up_or_down(request):
    if request.method == 'POST':
        back_dict = {'code': 0, 'msg': ''}
        if request.user.is_authenticated:
            article_id = request.POST.get('article_id')
            is_up = request.POST.get('is_up')
            is_up = json.loads(is_up)
            article_obj = models.Article.objects.filter(id = article_id).first()
            if not article_obj.blog.user == request.user:
                is_click = models.UpAndDown.objects.filter(user=request.user,article=article_obj).first()
                if not is_click:
                    if is_up:
                        article_obj.up_num += 1
                        article_obj.save()
                        back_dict['msg'] = '点赞成功'
                    else:
                        models.Article.objects.filter(id = article_id).update(down_num=F('down_num')+1)
                        back_dict['msg'] = '点踩成功'
                    models.UpAndDown.objects.create(user=request.user, article=article_obj, is_up=is_up)
                else:
                    if is_up == is_click.is_up:
                        if is_up:
                            article_obj.up_num -= 1
                        else:
                            article_obj.down_num -= 1
                        article_obj.save()
                        models.UpAndDown.objects.filter(user=request.user,article=article_obj).delete()
                        back_dict['code'] = 1001
                        back_dict['msg'] = '取消成功'
                    else:
                        back_dict['code'] = 1008 if is_up else 1000
                        back_dict['msg'] = '已经点了踩了' if is_up else '已经点了赞了'

            else:
                back_dict['code'] = 1002
                back_dict['msg'] = '不能给自己点'
        else:
            back_dict['code'] = 1003
            back_dict['msg'] = '请求<a href="/login/">登录</a>'
        return JsonResponse(back_dict)


def comment(request):
    if request.method == 'POST':
        back_dict = {'code':0,'msg':''}
        article_id = request.POST.get('article_id')
        content = request.POST.get('content')
        parent_id = request.POST.get('parent_id')
        models.Article.objects.filter(id=article_id).update(comment_num = F('comment_num')+1)
        models.Comment.objects.create(user=request.user,article_id=article_id,content=content,parent_id=parent_id)
        back_dict['msg'] = '评论成功'
        return JsonResponse(back_dict)

@login_required
def backend(request):
    user_obj = models.User.objects.filter(username=request.user.username).first()
    blog = user_obj.blog
    article_queryset = models.Article.objects.filter(blog = blog,is_delete=False)
    category_queryset = models.Category.objects.filter(blog = blog,is_delete=False)
    tag_queryset = models.Tag.objects.filter(blog = blog,is_delete=False)
    comment_queryset = models.Comment.objects.filter(article__blog = blog,article__is_delete=False)
    return render(request, 'backend/backend.html',locals())

@login_required
def add_article(request):
    user_obj = models.User.objects.filter(username=request.user.username).first()
    blog = user_obj.blog
    #获取分类,标签
    category_queryset = models.Category.objects.filter(blog = blog,is_delete=False)
    tag_queryset = models.Tag.objects.filter(blog = blog,is_delete=False)
    if request.method == 'POST':
        title = request.POST.get('title')
        content = request.POST.get('content')
        category_id = request.POST.get('category_id')
        tags = request.POST.getlist('tags')
        soup = BeautifulSoup(content, 'html.parser')

        script_tags = soup.find_all('script')
        for i in script_tags:
            i.decompose()
        desc = soup.text[0:150]
        article_obj = models.Article.objects.create(title = title,description = desc,blog=blog,
                                                    content = str(soup),category_id = category_id)
        article_obj.tag.add(*tags)
        return redirect('/backend/')
    return render(request,'backend/add_article.html',locals())

@login_required
def add_category(request):
    user_obj = models.User.objects.filter(username=request.user.username).first()
    blog_obj = user_obj.blog
    if request.method == 'POST':
        name = request.POST.get('name')
        models.Category.objects.create(blog = blog_obj,name=name)
        return redirect('/backend/')
    return render(request,'backend/add_category.html',locals())

@login_required
def add_tag(request):
    user_obj = models.User.objects.filter(username=request.user.username).first()
    blog_obj = user_obj.blog
    if request.method == 'POST':
        name = request.POST.get('name')
        models.Tag.objects.create(blog = blog_obj,name=name)
        return redirect('/backend/')
    return render(request,'backend/add_tag.html',locals())

@login_required
def article_edit(request,article_id):
    user_obj = models.User.objects.filter(username=request.user.username).first()
    blog = user_obj.blog
    article_obj = models.Article.objects.filter(blog=blog,id=article_id).first()
    category_queryset = models.Category.objects.filter(blog =blog,is_delete=False)
    tag_queryset = models.Tag.objects.filter(blog =blog,is_delete=False)
    if request.method == 'POST':
        title = request.POST.get('title')
        content = request.POST.get('content')
        category_id = request.POST.get('category_id')
        tags = request.POST.getlist('tags')
        soup = BeautifulSoup(content, 'html.parser')

        script_tags = soup.find_all('script')
        for i in script_tags:
            i.decompose()
        desc = soup.text[0:150]
        models.Article.objects.filter(id=article_id).update(title = title,description = desc
                                                            ,content = content,category_id = category_id)
        article_obj.tag.set(tags)#一对多要单独放
        return redirect('/backend/')
    return render(request,'backend/article_edit.html',locals())

@login_required
def article_delete(request,article_id):
    models.Article.objects.filter(id=article_id).update(is_delete=True)
    return redirect('/backend/')

@login_required
def category_edit(request,category_id):
    category_obj = models.Category.objects.filter(id=category_id).first()
    if request.method == 'POST':
        name = request.POST.get('name')
        category_obj.name = name
        category_obj.save()
        return redirect('/backend/')
    return render(request,'backend/category_edit.html',locals())

@login_required
def category_delete(request,category_id):
    models.Category.objects.filter(id=category_id).update(is_delete=True)
    models.Article.objects.filter(category_id=category_id).update(is_delete=True)
    return redirect('/backend/')

@login_required
def tag_edit(request,tag_id):
    tag_obj = models.Tag.objects.filter(id=tag_id).first()
    if request.method == 'POST':
        name = request.POST.get('name')
        tag_obj.name = name
        tag_obj.save()
        return redirect('/backend/')
    return render(request,'backend/tag_edit.html',locals())

@login_required
def tag_delete(request,tag_id):
    models.Tag.objects.filter(id=tag_id).update(is_delete=True)
    return redirect('/backend/')

@login_required
def comment_delete(request,comment_id):
    models.Comment.objects.filter(id=comment_id).delete()
    return redirect('/backend/')

@login_required
def user_edit(request):
    back_dict = {'code':0 , 'msg':''}
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        site_name = request.POST.get('site_name')
        site_title = request.POST.get('site_title')
        site_theme = request.FILES.get('site_theme')
        if not re.match(r'^\w+@\w+\.\w+$', email):
            back_dict['code'] = 1001
            back_dict['msg'] = '邮箱格式有误'
            return JsonResponse(back_dict)
        if not re.match(r'^1[3-9]\d{9}$',phone):
            back_dict['code'] = 1002
            back_dict['msg'] = '手机号有误'
            return JsonResponse(back_dict)
        models.User.objects.filter(username=request.user.username).update(username=username,email=email
                                                                          ,phone=phone)
        blog_obj = models.Blog.objects.filter(user__username=request.user.username).first()
        blog_obj.site_name = site_name
        blog_obj.site_title = site_title
        blog_obj.site_theme = site_theme
        blog_obj.save()
        return JsonResponse(back_dict)

@login_required
def set_avatar(request):
    if request.method == 'POST':
        avatar = request.FILES.get('avatar')
        request.user.avatar = avatar
        request.user.save()
        return redirect('/home/')
    return render(request,'backend/set_avatar.html')


