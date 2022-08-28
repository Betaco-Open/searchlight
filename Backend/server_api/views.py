from django.http import HttpResponse
import datetime

from django.http.response import JsonResponse

def api(request,id):
        if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"id":id}
            return JsonResponse(html)