from django.core.validators import RegexValidator
from django import forms
from django.core.exceptions import ValidationError
from staffing_system import models
from staffing_system.utils.encrypt import md5


class BootstrapCss:
    # 除了特地声明的字段不服从该css样式
    bootstrap_exclude_fields = []
    # 给前端中每个循环出来的input元素加css样式
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name in self.bootstrap_exclude_fields:
                continue
            if field.widget.attrs:
                field.widget.attrs["class"] = "form-control"
                field.widget.attrs["placeholder"] = field.label
            else:
                field.widget.attrs = {
                    "class": "form-control",
                    "placeholder": field.label
                }

class cssModelForm(BootstrapCss, forms.ModelForm):
    pass


class cssForm(BootstrapCss, forms.Form):
    pass


# 靠forms.ModelForm来遍历UserInfo中的数据
class my_form(cssModelForm):
    # 添加数据校验要求
    name = forms.CharField(min_length=2, label="用户名")

    # password = forms.CharField(validators="放正则表达式",label="密码")

    class Meta:
        model = models.UserInfo
        fields = ["name", "password", "gender", "age", "account", "create_time", "depart"]

    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)


# 利用modelForm来遍历靓号,加校验，css样式
class prettynum_form(cssModelForm):
    # 格式校验1--字段+正则
    mobile = forms.CharField(
        label="手机号",
        validators=[RegexValidator(r'^1[0-9]{10}$', "手机号格式错误"), ],
    )

    # 格式校验2--钩子
    def clean_mobile(self):
        txt_mobile = self.cleaned_data["mobile"]
        exist = models.PrettyNum.objects.filter(mobile=txt_mobile).exists()
        # if len(txt_mobile) != 11:
        #     raise ValidationError("格式错误")
        if exist:
            raise ValidationError("手机号已存在")
        return txt_mobile

    class Meta:
        model = models.PrettyNum
        # 自定义
        # fields = ["id", "mobile","price", "level", "status"]
        #     除了什么字段
        #     exclude = [""]
        # 全部字段
        fields = "__all__"


# 给手机号加校验
class prettynum_edit_form(cssModelForm):
    # 格式校验 ，不可修改手机号，校验手机格式
    # mobile = forms.CharField(disabled=True,label="手机号")
    mobile = forms.CharField(
        label="手机号",
        validators=[RegexValidator(r'^1[0-9]{10}$', "手机号格式错误"), ],
    )

    # 手机号不可重复
    def clean_mobile(self):
        txt_mobile = self.cleaned_data["mobile"]
        # .exclude(id=self.instance.pk) 编辑时，查看数据库是否已存在新修改的手机号，除了本身
        exist = models.PrettyNum.objects.exclude(id=self.instance.pk).filter(mobile=txt_mobile).exists()
        if exist:
            raise ValidationError("手机号已存在")
        return txt_mobile

    class Meta:
        model = models.PrettyNum
        # 自定义
        fields = ["id", "mobile", "price", "level", "status"]
        #     除了什么字段
        #     exclude = [""]


# 在"添加管理员信息"功能里确定需要的输入框
class AdminModelForm(cssModelForm):
    # 数据库中没有该字段在此处添加一个新字段
    confirm_password = forms.CharField(
        label="确认密码",
        # 将确认密码改为密文
        # (render_value=True)是指密码输入不一致后,不清空密码和确认密码的输入框
        widget=forms.PasswordInput(render_value=True)
    )
    admin_name = forms.CharField(label="管理员用户名")

    # 要在页面显示的输入框，及数据
    class Meta:
        model = models.Admin
        fields = ["admin_name", "admin_pwd", "confirm_password"]
        # 将密码改为密文
        widgets = {
            "admin_pwd": forms.PasswordInput(render_value=True)

        }

    def clean_admin_pwd(self):
        pwd = self.cleaned_data.get("admin_pwd")
        return md5(pwd)

    #     钩子函数
    # 该函数不可变动,否则会造成识别不到该函数
    def clean_confirm_password(self):
        # form.cleaned_data:验证通过以后所有的数据
        pwd = self.cleaned_data.get("admin_pwd")
        confirm_pwd = md5(self.cleaned_data.get("confirm_password"))
        if pwd != confirm_pwd:
            raise ValidationError("密码不一致")
        # 返回confirm_pwd是因为,如果该字段在数据库中存在,则插入数据库时,会插入该confirm_pwd值,
        return confirm_pwd


# 因为和"添加管理员信息"展示的输入框不同,所以为"编辑管理员信息"添加一个新的modelform输入框
class AdminEditModelForm(cssModelForm):
    # 要在页面显示的输入框，及数据
    class Meta:
        model = models.Admin
        fields = ["admin_name", "admin_pwd"]
        # 将密码改为密文
        widgets = {
            "admin_pwd": forms.PasswordInput(render_value=True)
        }

    def clean_admin_pwd(self):
        pwd = self.cleaned_data.get("admin_pwd")
        return md5(pwd)


# reset密码
class AdminResetModelForm(cssModelForm):
    # 数据库中没有该字段在此处添加一个新字段
    confirm_password = forms.CharField(
        label="确认密码",
        # 将确认密码改为密文
        # (render_value=True)是指密码输入不一致后,不清空密码和确认密码的输入框
        widget=forms.PasswordInput(render_value=True)
    )

    # 要在页面显示的输入框，及数据
    class Meta:
        model = models.Admin
        fields = ["admin_pwd", "confirm_password"]
        # 将密码改为密文
        widgets = {
            "admin_pwd": forms.PasswordInput(render_value=True)
        }

    # 密码不能与之前的一致
    def clean_admin_pwd(self):
        pwd = self.cleaned_data.get("admin_pwd")
        md5_pwd = md5(pwd)
        exists = models.Admin.objects.filter(id=self.instance.pk, admin_pwd=md5_pwd).exists()
        if exists:
            raise ValidationError("密码不能与之前的一致")
        return md5_pwd

    #     钩子函数
    # 该函数不可变动,否则会造成识别不到该函数
    def clean_confirm_password(self):
        # form.cleaned_data:验证通过以后所有的数据
        pwd = self.cleaned_data.get("admin_pwd")
        confirm_pwd = md5(self.cleaned_data.get("confirm_password"))
        if pwd != confirm_pwd:
            raise ValidationError("密码不一致")
        # 返回confirm_pwd是因为,如果该字段在数据库中存在,则插入数据库时,会插入该confirm_pwd值,
        return confirm_pwd


# form,自己写所有字段(供html中使用）
class loginForm(cssForm):
    # name = forms.CharField(label="用户名",widget=forms.TextInput(attrs={"class":"form-control"}))
    # password = forms.CharField(label="密码",widget=forms.PasswordInput(attrs={"class":"form-control"}))
    name = forms.CharField(label="用户名", widget=forms.TextInput, required=True)
    password = forms.CharField(label="密码", widget=forms.PasswordInput, required=True)
    code = forms.CharField(label="验证码", widget=forms.TextInput, required=True)

    # 不对用户名密码进行二次处理clean_xxxx就没有用
    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)

# 管理员loginForm
class adminLoginForm(cssForm):
    # name = forms.CharField(label="用户名",widget=forms.TextInput(attrs={"class":"form-control"}))
    # password = forms.CharField(label="密码",widget=forms.PasswordInput(attrs={"class":"form-control"}))
    admin_name = forms.CharField(label="用户名", widget=forms.TextInput, required=True)
    admin_pwd = forms.CharField(label="密码", widget=forms.PasswordInput, required=True)
    code = forms.CharField(label="验证码", widget=forms.TextInput, required=True)

    # 不对用户名密码进行二次处理clean_xxxx就没有用
    def clean_password(self):
        pwd = self.cleaned_data.get("admin_pwd")
        print("pwd",pwd)
        return md5(pwd)

# ajax使用modelform
class TaskModelForm(cssModelForm):
    class Meta:
        model = models.Task
        fields = "__all__"
        widgets = {
            # "detail": forms.Textarea,
            "detail": forms.TextInput
        }

class OrderModelForm(cssModelForm):
    class Meta:
        model = models.Order
        # fields = ["title","price","status","admin"]
        exclude = ["oid","admin"]

class UpForm(cssForm):
    """ boss信息 """
    name = forms.CharField(label="姓名")
    age = forms.IntegerField(label="年龄")
    img = forms.FileField(label="头像")
    bootstrap_exclude_fields = ["img"]

class UpModelForm(cssModelForm):
    bootstrap_exclude_fields = ["img"]

    class Meta:
        model = models.City
        fields = "__all__"
