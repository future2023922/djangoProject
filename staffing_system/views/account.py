from django.http import HttpResponse
from django.shortcuts import render, redirect
from io import BytesIO
from staffing_system.utils.image_code import check_code

from staffing_system.utils.form import loginForm,adminLoginForm
from staffing_system import models


def login(request):
    if request.method == "GET":
        form = loginForm()
        return render(request, "userLogin.html", {"form": form})
    form = loginForm(data=request.POST)
    # 如果数据是合法的
    if form.is_valid():
        # print(form.cleaned_data)
        # 校验是否存在该用户
        data_dict = form.cleaned_data
        # 验证码的校验
        # 将用户输入数据的验证码剔除，（因为数据库中没有验证码字段）
        code = data_dict.pop("code")
        image_code = request.session.get("image_code")
        if code.upper() != image_code:
            form.add_error("code","验证码错误")
            return render(request, "userLogin.html", {"form": form})
        user = models.UserInfo.objects.filter(name=data_dict["name"]).first()

        print("user:", user.name)
        print("user:", user.password)

        # 如果该用户不存在
        if not user:
            # 则是用户名还是密码出错，导致和数据库整条都不符合
            username = models.UserInfo.objects.filter(name=data_dict["name"]).first()
            if not username:
                # 在用户框下方显示该信息
                form.add_error("name", "用户不存在")
            else:
                # 在密码框下方显示该信息
                form.add_error("password", "密码错误")
            return render(request, "userLogin.html", {"form": form})
        # 登陆成功
        # 网站生成随机字符串，存入浏览器的cookie，再存入session中的sessionid(django帮忙做了）
        # request.session["info"] = user.name
        request.session["info"] = {"id": user.id, "name": user.name}  # 此值是session-value
        # 重新给session设置一周的超时时间
        request.session.set_expiry(60 * 60 * 24 * 7)
        # return HttpResponse("提交成功")
        return redirect("/depart/list/")

    return render(request, "userLogin.html", {"form": form})

# 记得在中间件那里放行该页面
def admin_login(request):
    if request.method == "GET":
        form = adminLoginForm()
        return render(request, "adminLogin.html", {"form": form})
    form = adminLoginForm(data=request.POST)
    # 如果数据是合法的
    if form.is_valid():
        # print(form.cleaned_data)
        # 校验是否存在该用户
        data_dict = form.cleaned_data
        print(data_dict["admin_name"])
        # 验证码的校验
        # 将用户输入数据的验证码剔除，（因为数据库中没有验证码字段）
        code = data_dict.pop("code")
        image_code = request.session.get("image_code")
        if code.upper() != image_code:
            form.add_error("code","验证码错误")
            return render(request, "adminLogin.html", {"form": form})
        admin = models.Admin.objects.filter(admin_name = data_dict["admin_name"]).first()
        #如果管理员不存在
        if not admin:
            admin_name = models.Admin.objects.filter(admin_name=data_dict["admin_name"]).first()
            if not admin_name:
                form.add_error("admin_name","管理员不存在")
            else:
                form.add_error("admin_pwd","密码错误")
            return render(request, "adminLogin.html", {"form": form})

        # 登陆成功
        # 网站生成随机字符串，存入浏览器的cookie，再存入session中的sessionid(django帮忙做了）
        # request.session["info"] = user.name
        request.session["info"] = {"id": admin.id, "name": admin.admin_name}  # 此值是session-value
        # 重新给session设置一周的超时时间
        request.session.set_expiry(60 * 60 * 24 * 7)
        # return HttpResponse("提交成功")
        return redirect("/depart/list/")

    return render(request, "adminLogin.html", {"form": form})

def logout(request):
    request.session.clear()
    return redirect("/system/login/")


def image_generate(request):
    img, code_string = check_code()
    print(code_string)
    # 将验证码写入到session中
    request.session["image_code"] = code_string
    # 给session设置60s的超时时间
    request.session.set_expiry(60)


    stream = BytesIO()
    img.save(stream, 'png')
    return HttpResponse(stream.getvalue())
