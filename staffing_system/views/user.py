from staffing_system import models
from django.shortcuts import render, redirect
from staffing_system.utils.form import my_form

def user_list(request):
    querySet = models.UserInfo.objects.all()
    # for obj in querySet:
    # print(obj.id,obj.name,obj.password,obj.age,obj.account,obj.create_time.strftime("%Y-%m-%d"),obj.get_gender_display(),obj.depart.title)

    return render(request, 'userInfo.html', {"querySet": querySet})

def user_add(request):
    if request.method == "GET":
        context = {
            'gender_choices': models.UserInfo.gender_choice,
            'depart_list': models.Department.objects.all()
        }
        return render(request, "userAdd.html", context)
    if request.method == "POST":
        # 初初级写法
        name = request.POST.get("name")
        password = request.POST.get("password")
        age = request.POST.get("age")
        gender = request.POST.get("gender")
        account = request.POST.get("account")
        create_time = request.POST.get("create_time")
        depart_id = request.POST.get("dp")

        models.UserInfo.objects.create(name=name, password=password, age=age, gender=gender, account=account,
                                       create_time=create_time, depart_id=depart_id)
        return redirect("/user/list/")

def user_form_add(request):
    if request.method == "GET":
        form = my_form()
        return render(request, "userFormAdd.html", {"form": form})

    # 用户post提交数据，数据校验
    if request.method == "POST":
        form = my_form(data=request.POST)
        if form.is_valid():
            # 如果数据合法，保存到数据库
            form.save()
            return redirect("/user/list/")
        else:
            # 如果不合法，报错
            return render(request, "userFormAdd.html", {"form": form})

def user_edit(request, id):
    # 将id携带上
    obj = models.UserInfo.objects.filter(id=id).first()
    if request.method == "GET":
        form = my_form(instance=obj)
        return render(request, "userEdit.html", {"form": form})

    # obj = models.UserInfo.objects.filter(id=id).first()
    if request.method == "POST":
        form = my_form(data=request.POST, instance=obj)
        if form.is_valid():
            # 如果数据合法，保存到数据库
            form.save()
            return redirect("/user/list/")
        else:
            # 如果不合法，报错
            return render(request, "userFormAdd.html", {"form": form})

def user_delete(request, id):
    models.UserInfo.objects.filter(id=id).delete()
    return redirect("/user/list/")