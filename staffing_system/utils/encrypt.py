from djangoProject import settings
import hashlib

def md5(data_string):
    # 加盐,自定义盐
    # salt = "xxx"
    # obj = hashlib.md5(salt.encode('utf-8'))

    # django自带的盐
    obj = hashlib.md5(settings.SECRET_KEY.encode('utf-8'))
    obj.update(data_string.encode('utf-8'))
    return obj.hexdigest()
