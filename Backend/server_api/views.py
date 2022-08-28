from django.http import HttpResponse
import datetime

from django.http.response import JsonResponse

def current_datetime(request,id):
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % id
    return JsonResponse(html)