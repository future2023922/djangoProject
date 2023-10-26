"""djangoProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from django.urls import path

from staffing_system.views import depart,user,pretty,admin,account,task,order,upload,city
from django.urls import path, re_path
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    # 启用media
    # re_path:正则匹配路径，serve函数处理数据
    re_path(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}, name='media'),
    # 员工管理系统
    # 部门
    path('depart/list/', depart.depart_list),
    path('depart/add/',depart.depart_add),
    path('depart/delete/',depart.depart_delete),
    path('depart/<int:id>/edit/',depart.depart_edit),
    path('depart/multi/',depart.depart_multi),
    # 用户
    path('user/list/',user.user_list),
    path('user/add/',user.user_add),
    path('user/modelForm/add/',user.user_form_add),
    path('user/<int:id>/edit/',user.user_edit),
    path('user/<int:id>/delete/',user.user_delete),
    # 靓号
    path('prettynum/list/',pretty.prettynum_list),
    path('prettynum/add/',pretty.prettynum_add),
    path('prettynum/<int:id>/edit/',pretty.prettynum_edit),
    path('prettynum/<int:id>/delete/',pretty.prettynum_delete),
    # 管理员
    path('admin/list/',admin.admin_list),
    path('admin/add/',admin.admin_add),
    path('admin/<int:id>/edit/',admin.admin_edit),
    path('admin/delete/',admin.admin_delete),
    path('admin/<int:id>/reset/',admin.admin_reset),
    # 用户登录
    path('system/login/',account.login),
    # 管理员登录
    path('system/admin_login/', account.admin_login),
    # 登出
    path('system/logout/',account.logout),
    # 图片验证码
    path('system/image_generate/',account.image_generate),
    # 任务管理
    path('task/list/',task.task_list),
    path('task/ajax/',task.task_ajax),
    path('task/add/',task.task_add),
    # 订单
    path('order/list/',order.order_list),
    path('order/add/',order.order_add),
    path('order/delete/',order.order_delete),
    path('order/detail/',order.order_detail),
    path('order/edit/',order.order_edit),
# 上传文件
    path('upload/list/',upload.upload_list),
    path('upload/form/',upload.upload_form),
    path('model/form/',upload.upload_model_form),
    # 城市列表
    path('city/list/',city.city_list),
    path('city/delete/',city.city_delete),
]