from django.http import HttpResponse
import datetime
import redis
import pymongo
from django.http.response import HttpResponseBadRequest, JsonResponse
import os
def initialize():
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    pipe.set("totalKeys","0")
    pipe.execute()

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
def api(request,groupid):
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
def createGroup(request,groupid):
    r = redis.Redis(host='redis-18366.c305.ap-south-1-1.ec2.cloud.redislabs.com', port=18366, username='default', password=str(os.environ['PASSWORD']), decode_responses=True)
    #r.ping() 
    #client = pymongo.MongoClient("mongodb+srv://user12:{}@cluster0.iattu0o.mongodb.net/?retryWrites=true&w=majority".format(os.environ['MONGO_PASSWORD']), )#server_api=ServerApi('1'))
    #db = client.test
    pipe = r.pipeline()
    if request.method == 'GET': 
            now = datetime.datetime.now()
            deviceList = {'deviceID':[request.get('key')]}   
            #Create groupid as a unique digit and return it
            try:
                pipe.set(groupid,deviceList)
                pipe.execute()
                json = {"group-id":groupid}
                returnResponse =  JsonResponse(json)
            finally:
                returnResponse = HttpResponseBadRequest()
            return returnResponse

#----------Add Device to the Ecosystem of Devices-----------------
def deviceAdd(request,groupid):
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
def createDevice(request,groupid):
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

