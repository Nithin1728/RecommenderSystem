"""recommendersystem URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path

from recommendersystem import settings
from simple.views import index, user, userregistration, adminlogin, adminloginaction, adminhome, adminbase, \
    viewadminuserpage, activateusers, logout, uploadfile, storecsvdata, faslogin, fasloginaction, fashome,faspredection
from user.views import userlogincheck, userhome, userbase, userfitness, status, viewuserdailystatus,UserPredections

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', index, name="index"),
    url(r'^index/', index, name="index"),
    url(r'^user/',user,name="user"),

    url(r'^userregistration/',userregistration,name="userregistration"),
    url(r'^userlogincheck/', userlogincheck, name="userlogincheck"),
    url(r'^userhome/', userhome, name="userhome"),
    url(r'^userbase/', userbase, name="userbase"),
    url(r'^uploadfile/',uploadfile,name="uploadfile"),
    url(r'^storecsvdata/',storecsvdata,name="storecsvdata"),
    url(r'^UserPredections/',UserPredections,name='UserPredections'),

    url(r'^adminlogin/', adminlogin, name="adminlogin"),
    url(r'^adminhome/', adminhome, name="adminhome"),
    url(r'^adminbase/',adminbase,name="adminbase"),
    url(r'^adminloginaction/', adminloginaction, name="adminloginaction"),
    url(r'^viewadminuserpage/',viewadminuserpage, name="viewadminuserpage"),
    url(r'^activateusers/$', activateusers, name="activateusers"),

    url(r'^faslogin/', faslogin, name="faslogin"),
    url(r'^fasloginaction/', fasloginaction, name="fasloginaction"),
    url(r'^fashome/', fashome, name="fashome"),
    url(r'^userfitness/', userfitness, name="userfitness"),
    url(r'^status/', status, name="status"),
    url(r'^viewuserdailystatus/',viewuserdailystatus,name="viewuserdailystatus"),
    url(r'^faspredection/',faspredection,name='faspredection'),

    url(r'^logout/',logout,name="logout"),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
