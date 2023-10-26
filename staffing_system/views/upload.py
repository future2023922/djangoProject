import os

from django.conf import settings
from django.shortcuts import render, HttpResponse, redirect
from staffing_system.utils.form import UpForm,UpModelForm
from staffing_system import models


# 测试上传文件
def upload_list(request):
    # print(request.POST)
    # print(request.FILES)

    # 获取到文件对象
    file_object = request.FILES.get("avatar")
    print(file_object)
    # 将文件对象写入到服务器
    f = open("a1.png", mode='wb')
    for chunk in file_object.chunks():
        f.write(chunk)
    f.close()
    return render(request, "uploadList.html")


# 上传老板信息
def upload_form(request):
    if request.method == "GET":
        form = UpForm()
        return render(request, "uploadForm.html", {"form": form, "title": "form上传"})
    form = UpForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        print(form.cleaned_data)
        #    1. 读取图片内容，写入到文件夹，并获取图片的路径（数据库存储可以直接复制后访问图片位置的路径，而实际存储是要加上“app”的名称）
        img_object = form.cleaned_data.get("img") # 获取到文件对象
        # file_path = "staffing_system/static/img/"  但windows的路径分隔符会造成一些问题
        # 所以改用os.path.join
        # 数据库中存的路径改成可以直接复制后粘贴到地址后能访问的（不带app的名字）
        # dbfile_path = os.path.join(settings.MEDIA_ROOT,img_object.name)
        # # 存储文件路径要加app名字
        # file_path =os.path.join("staffing_system", dbfile_path)

        # 启用media
        # 绝对路径
        # media_path = os.path.join(settings.MEDIA_ROOT, img_object.name)
        # 相对路径
        media_path = os.path.join("media", img_object.name)
        f = open(media_path, mode="wb")
        for chunk in img_object.chunks():
            f.write(chunk)
        f.close()
        #  2. 将路径保存到数据库
        models.BossInfo.objects.create(
            name=form.cleaned_data["name"],
            age=form.cleaned_data["age"],
            img=media_path
        )
        return redirect("/upload/form/")
    return render(request, "uploadForm.html", {"form": form, "title": "form上传"})

# 上传城市信息，若有重复图片，自动给重复图片的名字的末尾加随机字符串
def upload_model_form(request):
    if request.method == "GET":
        form = UpModelForm()
        return render(request,"uploadForm.html",{"form":form,"title":"modelform上传"})
    form = UpModelForm(data=request.POST,files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect("/city/list/")
    return render(request,"uploadForm.html",{"form":form,"title":"modelform上传"})