import re

from django import forms
from django.core.validators import RegexValidator
from ts import models

class RegForm(forms.Form):
    username = forms.CharField(max_length=8,min_length=4,label='用户名',error_messages={
        'max_length':'至多8位',
        'min_length':'至少4位',
        'required':'用户名不能为空'},widget=forms.TextInput(attrs={'class':'form-control'}))

    password = forms.CharField(max_length=16,min_length=6,label='密码',error_messages={
        'max_length': '至多16位',
        'min_length': '至少6位',
        'required': '密码不能为空'
    },widget=forms.PasswordInput(attrs={'class':'form-control'}))

    password2 = forms.CharField(max_length=16,min_length=6,label='确认密码',error_messages={
        'max_length': '至多16位',
        'min_length': '至少6位',
        'required': '确认密码不能为空'
    },widget=forms.PasswordInput(attrs={'class':'form-control'}))

    email = forms.EmailField(label='邮箱',error_messages={
        'invalid': '格式有误',
        'required': '邮箱不能为空'
    },widget=forms.EmailInput(attrs={'class':'form-control'}))

    phone = forms.CharField(label='手机号',error_messages={
        'required': '手机号不能为空'
    },validators=[
        RegexValidator(r'^\d+$','输入数字'),
        RegexValidator(r'1[3-9]\d{9}','格式有误')
    ],widget=forms.TextInput(attrs={'class':'form-control'}))

    #钩子
    # def clean_phone(self):
    #     phone = self.cleaned_data.get('phone')
    #     if not re.match(r'^\d+$',phone):
    #         self.add_error('phone','数字')
    #     if not re.match(r'1[3-9]\d{9}',phone):
    #         self.add_error('phone','格式有误')
    #     return phone

    def clean_username(self):
        username = self.cleaned_data.get('username')
        user_obj = models.User.objects.filter(username=username).exists()
        if user_obj:
            self.add_error('username','用户名已存在')
        return username

    def clean(self):
        password = self.cleaned_data.get('password')
        password2 = self.cleaned_data.get('password2')
        if password != password2:
            self.add_error('password','两次不一致')
        return self.cleaned_data
