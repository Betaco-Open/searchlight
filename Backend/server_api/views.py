from django.http import HttpResponse
import datetime
import redis
from django.http.response import JsonResponse
import os

def api(request,id):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    r.ping()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"id":id}
            return JsonResponse(html)