from django.http import HttpResponse
import datetime
import redis
from django.http.response import JsonResponse

def api(request,id):
    r = redis.Redis()
    r.ping()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"id":id}
            return JsonResponse(html)