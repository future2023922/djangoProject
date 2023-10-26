import json
from django.shortcuts import render,HttpResponse
from django.views.decorators.csrf import csrf_exempt

from staffing_system import models
from staffing_system.utils.form import TaskModelForm

# 展示人物列表
from staffing_system.utils.pagination import Pagination


def task_list(request):
    # 数据库中获取数据
    queryset = models.Task.objects.all().order_by('-id')
    # 分页
    page_object = Pagination(request, queryset)

    # 用modelform创建输入框，及样式，规则等
    form = TaskModelForm()

    context = {
        "form": form,
        "queryset": page_object.page_queryset,  # 分完页的数据
        "page_string": page_object.html()  # 生成页码
    }
    return render(request,"taskList.html",context)

# 添加任务信息
@csrf_exempt
def task_add(request):
    print(request.POST)
    # 对提交的数据进行校验
    form = TaskModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        data_dict = {"status":True}
        return HttpResponse(json.dumps(data_dict))
    # 展示错误信息，必填项未填
    data_dict = {"stauts":False,"error":form.errors}
    return HttpResponse(json.dumps(data_dict))

# 测试ajax
@csrf_exempt
def task_ajax(request):
    # print(request.GET)
    # return HttpResponse(request.POST)
    return HttpResponse(json.dumps(request.POST))