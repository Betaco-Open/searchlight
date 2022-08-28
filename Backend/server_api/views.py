from django.http import HttpResponse
import datetime
import redis
from django.http.response import JsonResponse

def api(request,id):
    r = redis.from_url('redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com:18366')

    r.ping()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"id":id}
            return JsonResponse(html)