from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.
class Delete(models.Model):
    is_delete = models.BooleanField(default=False,verbose_name='是否删除')

    class Meta:#抽象类，防止建表
        abstract = True

class User(AbstractUser,Delete):
    phone = models.BigIntegerField(verbose_name='手机号',null=True,blank=True)
    avatar = models.FileField(upload_to='avatar/',default='avatar',verbose_name='用户头像')
    creat_time = models.DateTimeField(auto_now_add=True,verbose_name='时间')
    #外键
    blog = models.OneToOneField(to='Blog',on_delete=models.CASCADE,null=True,blank=True)


class Blog(Delete):
    site_name = models.CharField(max_length=32,verbose_name='站点名称')
    site_title = models.CharField(max_length=32,verbose_name='站点标题')
    site_theme = models.FileField(upload_to='site_theme/',verbose_name='站点样式',null=True,blank=True)
    def __str__(self):
        return self.site_name

class Tag(Delete):
    name = models.CharField(max_length=32,verbose_name='标签名')
    #外键
    blog = models.ForeignKey(to='Blog',on_delete=models.CASCADE,null=True,blank=True)
    def __str__(self):
        return self.name

class Category(Delete):
    name = models.CharField(max_length=32, verbose_name='分类名')
    # 外键
    blog = models.ForeignKey(to='Blog', on_delete=models.CASCADE, null=True, blank=True)
    def __str__(self):
        return self.name

class Article(Delete):
    title = models.CharField(max_length=64, verbose_name='文章标题')
    description = models.CharField(max_length=255,verbose_name='文章简介')
    content = models.TextField(verbose_name='文章内容')
    create_time = models.DateTimeField(auto_now_add=True,verbose_name='文章创建时间')
    up_num = models.IntegerField(verbose_name='点赞数',default=0)
    down_num = models.IntegerField(verbose_name='点踩数',default=0)
    comment_num = models.IntegerField(verbose_name='评论数',default=0)

    blog = models.ForeignKey(to='Blog', on_delete=models.CASCADE, null=True, blank=True)
    category = models.ForeignKey(to='Category', on_delete=models.CASCADE)
    tag = models.ManyToManyField(to='Tag')
    def __str__(self):
        return self.title

class UpAndDown(models.Model):
    is_up = models.BooleanField()
    article = models.ForeignKey(to='Article', on_delete=models.CASCADE)
    user = models.ForeignKey(to='User', on_delete=models.CASCADE)

class Comment(Delete):
    user = models.ForeignKey(to='User', on_delete=models.CASCADE)
    article = models.ForeignKey(to='Article', on_delete=models.CASCADE)
    content = models.TextField(verbose_name='评论内容')
    comment_time = models.DateTimeField(auto_now_add=True,verbose_name='评论时间')

    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
