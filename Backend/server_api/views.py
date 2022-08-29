from django.http import HttpResponse
import datetime
import redis
import pymongo
from django.http.response import HttpResponseBadRequest, HttpResponseServerError, JsonResponse
import os
from django.views.decorators.csrf import csrf_exempt
import json
def initialize():
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    r.set("totalDevices",0)
    r.set("totalGroups",0)

    #pipe.execute()
#initialize()
def int32_to_id(n):
  if n==0: return "0"
  chars="0123456789ACEFHJKLMNPRTUVWXY"
  length=len(chars)
  result=""
  remain=n
  while remain>0:
    pos = remain % length
    remain = remain // length
    result = chars[pos] + result
  return result

#-------------Always Returns 200 OK code(To Check if WebServer is Up)----------
def api(request):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    #r.ping()    
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    #pipe = r.pipeline()
    #pipe.set("a", "a value")
    #pipe.execute()
    if request.method == 'GET':
            #now = datetime.datetime.now()
            returnResponse = "API is Working"
            return HttpResponse(returnResponse)
#----------Create Ecosystem of Devices(On Main Device)-----------------
@csrf_exempt
def createGroup(request,username):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    #r.ping() 
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    if request.method == 'GET': 
        try:
            #now = datetime.datetime.now()
            deviceID = request.GET.get('id')
            deviceKey = request.GET.get('key')
            # print(deviceID,deviceKey)
            if json.loads(r.get(deviceID))["deviceInfo"][0]["key"]==deviceKey:
                deviceList = {'deviceID':[request.GET.get('id')]}   
                #Create groupid as a unique digit and return it
                groupid="S-"+str(int32_to_id(r.incr("totalGroups")))
                pipe.set(groupid,json.dumps(deviceList))
                pipe.execute()
                jsonb = {"group-id":groupid}
                returnResponse =  JsonResponse(json.dumps(jsonb),safe=False)
            return returnResponse
        finally:
            return HttpResponseBadRequest()
    else:
        return HttpResponse(content='Error Not GET Req')

#----------Add Device to the Ecosystem of Devices-----------------
def deviceAdd(request,groupid):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    #r.ping() 
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    if request.method == 'GET': 
            #now = datetime.datetime.now()
            deviceID = request.GET.get('id')
            deviceKey = request.GET.get('key')
            # print(deviceID,deviceKey)
            if json.loads(r.get(deviceID))["deviceInfo"][0]["key"]==deviceKey:
                print(r.get(groupid))
                newDeviceList = json.loads(r.get(deviceID))
                print(newDeviceList)
                jsonb={}
                # deviceList = {'deviceID':[request.GET.get('id')]}   
                # #Create groupid as a unique digit and return it
                # groupid="S-"+str(int32_to_id(r.incr("totalGroups")))
                # pipe.set(groupid,json.dumps(deviceList))
                # pipe.execute()
                # jsonb = {"group-id":groupid}
                returnResponse =  JsonResponse(json.dumps(jsonb),safe=False)
            return returnResponse
    else:
        return HttpResponse(content='Error Not GET Req')

#----------Return Recent Files Across Ecosystem of devices-----------------
def recent(request,groupid):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    r.ping()    
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    pipe.set("a", "a value")
    pipe.execute()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"group-id":groupid}
            return JsonResponse(html)
#----------Return Recent Images  across deviceList-----------------
def recentImages(request,groupid):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    r.ping()    
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    pipe.set("a", "a value")
    pipe.execute()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"group-id":groupid}
            return JsonResponse(html)
#----------Return Recent Documents  across deviceList-----------------
def recentDocuments(request,groupid):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    r.ping()    
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    pipe.set("a", "a value")
    pipe.execute()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"group-id":groupid}
            return JsonResponse(html)
#----------Return Recent Notes across deviceList-----------------
def recentNotes(request,groupid):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    r.ping()    
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    pipe.set("a", "a value")
    pipe.execute()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"group-id":groupid}
            return JsonResponse(html)
#----------Return Result of Search Query-----------------
def search(request,groupid):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    r.ping()    
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    pipe.set("a", "a value")
    pipe.execute()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            html = {"group-id":groupid}
            return JsonResponse(html)
#----------Return Result of Search Query-----------------
@csrf_exempt 
def createDevice(request,username):    
    if request.method == 'POST': 
            if is_valid_mac(request.POST.get('mac')):
                r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
                idr=int(r.incr('totalDevices'))
                #r.ping() 
                #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
                #db = client.test
                pipe = r.pipeline()
                now = datetime.datetime.now()
                deviceID="DEV_ID_"+int32_to_id(idr)
                deviceKey=str(uuid.uuid4())
                infojson={
                    'deviceInfo':[{'key': deviceKey,
                    'MAC': str(request.POST.get('mac')),
                    'OS' : str(request.POST.get('os')),
                    'User':str(username)}]
                }
                pipe.set(deviceID,json.dumps(infojson))
                pipe.execute()
                returnjson={str(deviceID):infojson}
                returnResponse =  JsonResponse(json.dumps(returnjson),safe=False)
                return returnResponse
            else:
                return HttpResponseServerError()
    else:
        return HttpResponseBadRequest()

import re
import uuid
def is_valid_mac(str):
#regural expression
  regex = ("^([0-9A-Fa-f]{2}[:-])" +"{5}([0-9A-Fa-f]{2})|" +"([0-9a-fA-F]{4}\\." +"[0-9a-fA-F]{4}\\." +"[0-9a-fA-F]{4})$")
  match = re.compile(regex)
  if (str == None):
    return False
  if(re.search(match, str)):
    return True
  else:
    return False
