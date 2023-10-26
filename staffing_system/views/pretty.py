from staffing_system import models
from django.shortcuts import render, redirect
from staffing_system.utils.form import prettynum_form,prettynum_edit_form
from staffing_system.utils.pagination import Pagination

# Create your views here.






# def prettynum_list(request):
#     # 搜索手机号
#     # 写法1
#     # q1 = models.PrettyNum.objects.filter(mobile="12345678993",id=8)
#     # print(q1) # <QuerySet [<PrettyNum: PrettyNum object (8)>]>
#
#     # 写法2
#     # data_dict = {"mobile":12345678993,"id":8}
#     # # **为字典的解包写法
#     # q2 = models.PrettyNum.objects.filter(**data_dict)
#     # print(q2) # <QuerySet [<PrettyNum: PrettyNum object (8)>]>
#
#     # models.PrettyNum.objects.filter(id_gt = 8) # 大于8
#     # models.PrettyNum.objects.filter(id_gte = 8) # 大于等于8
#     # models.PrettyNum.objects.filter(id_lt = 8) # 小于8
#     # models.PrettyNum.objects.filter(id_lte = 8) # 小于等于8
#
#     # data_dict = {"id_lte":8}
#     # q2 = models.PrettyNum.objects.filter(**data_dict)
#
#     # models.PrettyNum.objects.filter(mobile__startswith="123")  # 筛选出以123开头
#     # models.PrettyNum.objects.filter(mobile__endswith="123")  # 筛选出以123结尾
#     # models.PrettyNum.objects.filter(mobile__contains="123")  # 筛选出包含123
#
#     # data_dict = {"mobile__contains": "123"}
#     # models.PrettyNum.objects.filter(**data_dict)
#
#     data_dict = {}
#     search_data = request.GET.get("q","")
#     if search_data:
#         data_dict = {"mobile__contains": search_data}
#     #   如果字典为空，则**代表获取所有，即没有限制
#
#     # 1.根据自己的情况去筛选自己的数据
#     querySet = models.PrettyNum.objects.filter(**data_dict).order_by("-level")
#     # 2.实例化分页对象
#     page_object = Pagination(request, querySet)
#
#     context = {
#         "queryset": page_object.page_queryset,  # 分完页的数据
#         "page_string": page_object.html()       # 生成页码
#     }
#     return render(request, "prettynumList.html", {"querySet": querySet,"search_data":search_data},context)

def prettynum_list(request):
    # 搜索手机号
    # 写法1
    # q1 = models.PrettyNum.objects.filter(mobile="12345678993",id=8)
    # print(q1) # <QuerySet [<PrettyNum: PrettyNum object (8)>]>

    # 写法2
    # data_dict = {"mobile":12345678993,"id":8}
    # # **为字典的解包写法
    # q2 = models.PrettyNum.objects.filter(**data_dict)
    # print(q2) # <QuerySet [<PrettyNum: PrettyNum object (8)>]>

    # models.PrettyNum.objects.filter(id_gt = 8) # 大于8
    # models.PrettyNum.objects.filter(id_gte = 8) # 大于等于8
    # models.PrettyNum.objects.filter(id_lt = 8) # 小于8
    # models.PrettyNum.objects.filter(id_lte = 8) # 小于等于8

    # data_dict = {"id_lte":8}
    # q2 = models.PrettyNum.objects.filter(**data_dict)

    # models.PrettyNum.objects.filter(mobile__startswith="123")  # 筛选出以123开头
    # models.PrettyNum.objects.filter(mobile__endswith="123")  # 筛选出以123结尾
    # models.PrettyNum.objects.filter(mobile__contains="123")  # 筛选出包含123

    # data_dict = {"mobile__contains": "123"}
    # models.PrettyNum.objects.filter(**data_dict)

    # for i in range(300):
    #     models.PrettyNum.objects.create(mobile="19989898989")

    data_dict = {}
    search_data = request.GET.get("q","")
    if search_data:
        data_dict = {"mobile__contains": search_data}
    #   如果字典为空，则**代表获取所有，即没有限制

    # 1.根据自己的情况去筛选自己的数据
    querySet = models.PrettyNum.objects.filter(**data_dict).order_by("-level")
    # 2.实例化分页对象
    page_object = Pagination(request, querySet)

    context = {
        "querySet": page_object.page_queryset,  # 分完页的数据
        "page_string": page_object.html()       # 生成页码
    }
    return render(request, "prettynumList.html", {"context": context,"search_data":search_data,})

def prettynum_add(request):
    if request.method == "GET":
        form = prettynum_form()
        return render(request, "prettynumAdd.html", {"form": form})
    # 如果要post提交数据
    # 获取post提交的数据
    form = prettynum_form(data=request.POST)
    if form.is_valid():
        form.save()
        return redirect("/prettynum/list/")
    else:
        return render(request,"prettynumAdd.html",{"form":form})

def prettynum_edit(request,id):
    obj = models.PrettyNum.objects.filter(id=id).first()
    if request.method == "GET":
        form = prettynum_edit_form(instance=obj)
        return render(request,"prettynumEdit.html",{"form":form})
    # 如果要post提交数据
    # 获取post数据信息
    form = prettynum_edit_form(data=request.POST, instance=obj)
    # 数据合法
    if form.is_valid():
        form.save()
        return redirect("/prettynum/list/")
    # 不合法，提示
    else:
        return render(request,"prettynumEdit.html",{"form":form})

def prettynum_delete(request,id):
    models.PrettyNum.objects.filter(id=id).delete()
    return redirect("/prettynum/list/")