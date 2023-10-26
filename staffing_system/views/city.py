from staffing_system import models
from django.shortcuts import render, redirect,HttpResponse

def city_list(request):
    city_list = models.City.objects.all()
    return render(request,"cityList.html",{"city_list":city_list})

def city_delete(request):
    # 获取当前要删除的数据的id
    id = request.GET.get("id")
    # 数据库删除
    models.City.objects.filter(id=id).delete()
    return redirect('/city/list/')