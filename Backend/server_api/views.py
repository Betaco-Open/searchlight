from django.http import HttpResponse
import datetime

from django.http.response import JsonResponse

def current_datetime(request,id):
        if request.GET: 
            now = datetime.datetime.now()
            html = {"id":id}
            return JsonResponse(html)