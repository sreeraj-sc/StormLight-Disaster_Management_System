"""dems URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('',views.first),
    path('index',views.index),
    path('register/',views.register),
    path('register/adduser',views.adduser),
    path('service',views.service),
    path('addservice',views.addservice),
    path('volregister',views.volregister),
    path('addvol',views.addvol),
    path('emrgnyreg',views.emrgnyreg),
    path('addemrgnyreg',views.addemrgnyreg),
    path('login/',views.login),
    path('login/addlogin',views.addlogin),
    path('logout/',views.logout),
    path('view_emergencyservice',views.view_emergencyservice),
    path('serrequest/<int:id>',views.serrequest),
    path('serrequest/addserreq',views.addserreq),
    path('serrequest/addserreq_user',views.addserreq_user),
    path('profile',views.profile),

    path('userproupdt/<int:id>',views.userproupdt),
    path('userproupdt/pupdate/<int:id>',views.pupdate),
    
    path('emcservices',views.emcservices),
    path('addemcservices',views.addemcservices),
    path('addemcservices2',views.addemcservices2),
    path('viewvol',views.viewvol),
    path('removevol/<int:id>',views.removevol),
    path('viewusers',views.viewusers),
    path('removeuser/<int:id>',views.removeuser),
    path('viewservice',views.viewservice),
    path('removeser/<int:id>',views.removeser),
    path('srreqsts',views.srreqsts),
    path('assignreq/<int:id>',views.assignreq),
    path('assignreq/addassignreq/<int:id>',views.addassignreq),
    path('viewreqst',views.viewreqst),
    path('emc_srreqsts',views.emc_srreqsts),
    path('emc_srreqsts_user',views.emc_srreqsts_user),
    path('accept/<int:id>',views.accept),
    path('reject/<int:id>',views.reject),
    path('report/<int:id>',views.report),
    path('userreqs',views.userreqs),
    path('v_profile',views.v_profile),
    path('v_proupdt/<int:id>',views.v_proupdt),
    path('v_proupdt/v_pupdate/<int:id>',views.v_pupdate),
    path('donation',views.donation),
    path('donate',views.donate),
    path('v_donation',views.v_donation),
    path('camp',views.camp),
    path('addcamp',views.addcamp),
    path('v_camp',views.v_camp),
    path('search',views.search),
    path('remove_camp/<int:id>',views.remove_camp),
    path('add_hospital',views.add_hospital),
    path('v_hos',views.v_hos),
    path('remove_hos/<int:id>',views.remove_hos),

    path('customer_chat',views.customer_chat),
    path('addchat_customer',views.addchat_customer),
    path('view_chats',views.view_chats),
    path('chat_team/<int:id>/',views.chat_team,name='chat_team'),
    path('addchat_admin',views.addchat_admin,name='addchat_admin'),





]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
