"""server_api URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from re import search
from django.contrib import admin
from django.urls import path
from Backend.server_api.views import createGroup
from views import *
urlpatterns = [
    #path('admin/', admin.site.urls),
    path('api/<str:group-id>/',api),
    path('api/create/<str:group-id>',createGroup),
    path('api/deviceCreate/<str:group-id>',createDevice),
    path('api/deviceAdd/<str:group-id>',recent),
    path('api/recent/<str:group-id>',recent),
    path('api/recentImages/<str:group-id>',recentImages),
    path('api/recentDocuments/<str:group-id>',recentDocuments),
    path('api/recentNotes/<str:group-id>',recentNotes),
    path('api/search/<str:group-id>',search),
    path('api/search/<str:group-id>',search),
    

]
