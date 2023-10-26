from django.middleware.common import MiddlewareMixin
from django.shortcuts import redirect
from django.http import HttpResponse

class AuthMiddleware(MiddlewareMixin):
    def process_request(self,request):
        # 登录页面及验证码图片放行
        if request.path_info in ["/system/login/","/system/image_generate/","/system/admin_login/"]:
            return
        # 如果能获取到session信息，说明已登录过，可以向后执行
        session = request.session.get("info")
        if not session:
            return redirect("/system/login/")
        return
        # print("m1,come in")
    #     如果该方法中没有返回值，则继续往后走
    #   如果有HttpResponse，render，redirect则不再继续向后执行

    def process_response(self,request, response):
        # print("m1,come out")
        return response

