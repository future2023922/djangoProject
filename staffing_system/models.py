from django.db import models
from MySQLdb.constants.FIELD_TYPE import SET

# Create your models here.
class Admin(models.Model):
    """管理员表"""
    admin_name = models.CharField(verbose_name="用户名",max_length=32)
    admin_pwd = models.CharField(verbose_name="密码",max_length=64)

    def __str__(self):
        return self.admin_name

class Department(models.Model):
    """ 部门表 """
    # verbose_name:对该字段的注释
    title = models.CharField(verbose_name="部门名称",max_length=32)
    def __str__(self):
        return self.title

class UserInfo(models.Model):
    """ 用户表 """
    name = models.CharField(verbose_name="用户名",max_length=16)
    password = models.CharField(verbose_name="密码",max_length=64)
    age = models.IntegerField(verbose_name="年龄")
    # max_digits=10:数字最大长度为10
    # decimal_places=2:小数部分占2位
    account = models.DecimalField(verbose_name="账户余额",max_digits=10,decimal_places=2,default=0)
    # create_time = models.DateTimeField(verbose_name="入职时间")
    create_time = models.DateField(verbose_name="入职时间")

    # 无约束
    # depart_id = models.IntegerField(verbose_name="部门id")

    # 有约束:部门id只能填入部门表中已有的id
    # to:与哪张表关联
    # to_fields:与表里的哪列关联
    # 写的变量为depart,但Django中默认将depart字段->depart_id
    # cascade:级联删除
    depart = models.ForeignKey(to="Department",to_field="id",on_delete=models.CASCADE,verbose_name="所属部门")
    # 删除置空
    # depart = models.ForeignKey(to="Department",to_fields="id",null=True,blank=True,on_delete=models.SET_NULL)

    gender_choice = (
        (1,"男"),
        (2,"女")
    )
    # SmallIntegerField:占空间极小
    gender = models.SmallIntegerField(verbose_name="性别",choices=gender_choice)

class PrettyNum(models.Model):
    mobile = models.CharField(verbose_name="手机号",max_length=11)
    price = models.IntegerField(verbose_name="价格",default=0)

    level_choices = (
        (1,'1级'),
        (2,'2级'),
        (3,'3级'),
        (4,'4级'),
    )

    level = models.SmallIntegerField(verbose_name="级别",choices=level_choices,default=1)

    status_choices = (
        (1,"已占用"),
        (0,"未占用"),
    )

    status = models.SmallIntegerField(verbose_name="状态",choices=status_choices,default=0)

# modelform任务列表
class Task(models.Model):
    level_choices = (
        (1,"紧急"),
        (2,"重要"),
        (3,"临时"),
    )
    level = models.SmallIntegerField(verbose_name="级别",choices=level_choices,default=1)
    # CharField必须定义大小，max_length=64
    title = models.CharField(verbose_name="标题",max_length=64)
    detail = models.TextField(verbose_name="详细信息")
    # 有约束
    admin = models.ForeignKey(verbose_name="负责人",to="Admin",on_delete=models.CASCADE)

class Order(models.Model):
    """ 订单 """
    oid = models.CharField(verbose_name="订单号", max_length=64)
    title = models.CharField(verbose_name="名称", max_length=32)
    price = models.IntegerField(verbose_name="价格")

    status_choices = (
        (1, "待支付"),
        (2, "已支付"),
    )
    status = models.SmallIntegerField(verbose_name="状态", choices=status_choices, default=1)
    admin = models.ForeignKey(verbose_name="管理员", to="Admin", on_delete=models.CASCADE)

class BossInfo(models.Model):
    """ 老板信息 """
    name = models.CharField(verbose_name="姓名",max_length=32)
    age = models.IntegerField(verbose_name="年龄")
    img = models.CharField(verbose_name="头像路径",max_length=128)

class City(models.Model):
    """ 城市信息 """
    name = models.CharField(verbose_name="城市名称",max_length=32)
    count = models.IntegerField(verbose_name="人口")
    # FileField本质上也是CharField,文件自动保存    ，uploadto=“A”保存到media下的A目录下
    img = models.FileField(verbose_name="图片路径",max_length=128,upload_to="city/")

class Category(models.Model):
    """ 分类表"""
    name = models.CharField(max_length=128)
    def __str__(self):
     return self.name

class Product(models.Model):
    """ 产品表"""
    name = models.CharField(max_length=128,)
    # category = models.ForeignKey(Category, null=True, default=None, on_delete=SET(None))
    create_time = models.DateTimeField('创建时间', auto_now_add=True)
    def __str__(self):
        return self.name