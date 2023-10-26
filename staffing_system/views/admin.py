from staffing_system import models
from django.shortcuts import render, redirect
from staffing_system.utils.form import AdminModelForm,AdminEditModelForm,AdminResetModelForm


from staffing_system.utils.pagination import Pagination

def admin_list(request):
    # 构造搜索条件
    data_dict = {}
    search_data = request.GET.get("q","")
    if search_data:
        data_dict = {"admin_name__contains": search_data}

    # 设置搜索条件
    querySet = models.Admin.objects.filter(**data_dict)

    # 2.实例化分页对象
    page_object = Pagination(request, querySet)

    context = {
        "querySet": page_object.page_queryset,  # 分完页的数据
        "page_string": page_object.html()       # 生成页码
    }
    return render(request,'adminList.html',{"context": context,})

def admin_add(request):
    if request.method == "GET":
        form = AdminModelForm()
        return render(request, 'change.html', {"form": form, "title": "添加管理员"})
    # post请求，获取post请求体
    form = AdminModelForm(data = request.POST)
    # 请求体合法，保存数据，跳转至管理员列表
    if form.is_valid():
        # 校验确认密码和密码是否相同(在form.py中校验)
        form.save()
        return redirect("/admin/list/")
    return render(request, 'change.html', {"form": form, "title": "添加管理员"})

def admin_edit(request,id):
    # 查找某id的数据是否存在
    row_obejct = models.Admin.objects.filter(id=id).first()
    title = "编辑管理员信息(ModelForm版)"
    # 不存在
    if not row_obejct:
        return render(request,"error.html",{"msg":"数据不存在","title":title})
    # 存在
    # 如果是get请求,则是跳转到含有该条信息的编辑界面
    if request.method == "GET":
        form = AdminEditModelForm(instance=row_obejct)
        return render(request,"change.html",{"form":form})
    # 如果是post请求,则是修改完成后要提交跳转的逻辑
    form = AdminEditModelForm(data=request.POST,instance=row_obejct)
    if form.is_valid():
        form.save()
        return redirect("/admin/list/")
    return render(request,'adminList.html',{"form": form, "title": title})

def admin_delete(request):
    # 获取当前要删除的数据的id
    id = request.GET.get("id")
    models.Admin.objects.filter(id=id).delete()
    return redirect("/admin/list/")

def admin_reset(request,id):
    """重置密码"""
    row_object = models.Admin.objects.filter(id=id).first()
    # 标题加上重置密码的该用户名
    title = "重置密码 - {}".format(row_object.admin_name)
    if request.method == "GET":
        form = AdminResetModelForm()
        return render(request,"change.html",{"form":form,"title":title})
        # post请求，获取post请求体
    # 要加instance=row_object,才能确认将重置的密码更新到本条数据上,否则会再添加一条用户名为空的数据
    form = AdminResetModelForm(data=request.POST,instance=row_object)
    # 请求体合法，保存数据，跳转至管理员列表
    if form.is_valid():
        # 校验确认密码和密码是否相同
        form.save()
        return redirect("/admin/list/")
    return render(request, 'change.html', {"form": form, "title": title })
