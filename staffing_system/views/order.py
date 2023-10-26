from datetime import datetime
import random

from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

from staffing_system.utils.form import OrderModelForm
from staffing_system import models
from staffing_system.utils.pagination import Pagination


def order_list(request):
    # 数据库中获取数据
    queryset = models.Order.objects.all().order_by('-id')

    page_object = Pagination(request, queryset)

    form = OrderModelForm()

    context = {
        "form": form,
        "queryset": page_object.page_queryset,  # 分完页的数据
        "page_string": page_object.html()  # 生成页码
    }
    return render(request, "orderList.html", context)

@csrf_exempt
def order_add(request):
    form = OrderModelForm(data=request.POST)
    if form.is_valid():
        # form中oid（订单号）不用用户填，也没有自动生成，所以这里要指定一下订单的生成规则
        form.instance.oid = datetime.now().strftime("%Y%m%d%H%M%S") + str(random.randint(1000,9999))
        form.instance.admin_id = request.session["info"]["id"]
        form.save()
        return JsonResponse({"status":True})
    return JsonResponse({"status":False,"error":form.errors})

def order_delete(request):
    # 拿到要删除的订单的id
    uid = request.GET.get("uid")
    print(uid)
    # 确定是否存在该数据
    exists = models.Order.objects.filter(id=uid).exists()
    if not exists:
        return JsonResponse({"status":False,"error":"数据不存在"})

    models.Order.objects.filter(id=uid).delete()
    return JsonResponse({"status": True, })

# 根据点击的某行编辑，在弹窗中显示某行的信息
def order_detail(request):
    # 根据拿到的uid获取当前行对象

    # 方式一
    # uid = request.GET.get("uid")
    # row_object = models.Order.objects.filter(id=uid).first()
    # if not row_object:
    #     return JsonResponse({"status":False,"error":"数据不存在"})
    # data = {
    #     "status": row_object.status,
    #     "title": row_object.title,
    #     "price": row_object.price
    # }

    # 方式二
    uid = request.GET.get("uid")
    # 生成的不是对象，而是一个字典
    row_object = models.Order.objects.filter(id=uid).values("title","price","status").first()
    if not row_object:
        return JsonResponse({"status":False,"error":"数据不存在"})
    data = {
        "data":row_object
    }
    return JsonResponse(data)

@csrf_exempt
def order_edit(request):
    uid = request.GET.get("uid")
    row_object = models.Order.objects.filter(id=uid).first()
    # 如果数据不存在
    if not row_object:
        # 数据修改失败是error关键字，所以如果该数据不存在要换个关键字
        return JsonResponse({"status": False,"tips":"数据不存在" })
    form = OrderModelForm(data=request.POST,instance=row_object)
    # 数据保存成功
    if form.is_valid():
        form.save()
        return JsonResponse({"status":True})
    # 数据保存失败
    return JsonResponse({"status": False,"error":form.errors})