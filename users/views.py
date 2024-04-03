from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import redirect
from django.urls import reverse
from  django.core.files.storage import FileSystemStorage
import datetime
import pycurl
from urllib.parse import urlencode
from .models import *
from django.db.models import Q

# Create your views here.

def first(request):
    return render(request,'index.html')

def index(request):
    return render(request,'index.html')

def register(request):
    return render(request,'register.html')

def adduser(request):
    if request.method=="POST":
        name=request.POST.get('name')
        email=request.POST.get('email')
        address=request.POST.get('address')
        phone=request.POST.get('phone')
        password=request.POST.get('password')
       

        cus=userregg(name=name,email=email,address=address,phone=phone,password=password)
        cus.save()
    return render(request,'index.html', {'message1':'successfully Registered'})

def service(request):
    return render(request,'addservice.html')

def addservice(request):
    if request.method=="POST":
        name=request.POST.get('service')

        cus=services(name=name)
        cus.save()
    return render(request,'addservice.html', {'message1':'successfully Added'})

def volregister(request):
    sel=services.objects.all()
    return render(request,'volregister.html',{'result':sel})

def addvol(request):
    if request.method=="POST":
        name=request.POST.get('name')
        email=request.POST.get('email')
        address=request.POST.get('address')
        state=request.POST.get('state')
        phone=request.POST.get('phone')
        age=request.POST.get('age')
        gender=request.POST.get('gender')
        service=request.POST.get('service')
        password=request.POST.get('password')
       

        cus=volregg(state=state,name=name,email=email,address=address,phone=phone,age=age,gender=gender,service=service,password=password)
        cus.save()
    return render(request,'index.html', {'message2':'successfully Registered'})

def emrgnyreg(request):
    return render(request,'emergencyreg.html')

def addemrgnyreg(request):
    if request.method=="POST":
        name=request.POST.get('name')
        password=request.POST.get('password')
       
        cus=emergency(name=name,password=password)
        cus.save()
    return render(request,'emergencyreg.html', {'message2':'successfully Registered'})

def login(request):
    return render(request,'login.html')

def addlogin(request):
    email = request.POST.get('email')
    password = request.POST.get('password')
    if email == 'admin@gmail.com' and password =='admin':
        request.session['logintdetail'] = email
        request.session['admin'] = 'admin'
        return redirect(index)

    elif userregg.objects.filter(email=email,password=password).exists():
        userdetails=userregg.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['uid'] = userdetails.id
            request.session['uname'] = userdetails.name
            #request.session['number'] = userdetails.number
            request.session['uemail'] = email 

            return redirect(index)

    elif volregg.objects.filter(email=email,password=password).exists():
        userdetails=volregg.objects.get(email=request.POST['email'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['vid'] = userdetails.id
            request.session['vname'] = userdetails.name
            request.session['vemail'] = email

            return redirect(index)
        
    elif emergency.objects.filter(name=email,password=password).exists():
        userdetails=emergency.objects.get(name=email, password=password)
        if userdetails.password == request.POST['password']:
            request.session['eid'] = userdetails.id
            request.session['ename'] = userdetails.name

            return redirect(index)

    else:
        return render(request, 'login.html', {'message4':'Invalid Email or Password'})
    
def logout(request):
    session_keys = list(request.session.keys())
    for key in session_keys:
        del request.session[key]
    return redirect(first)

def view_emergencyservice(request):
    sel=services.objects.all()
    return render(request,'view_emrgcysr.html',{'result':sel})

def serrequest(request,id):
    sel=services.objects.get(id=id)
    return render(request,'servicereq.html',{'result':sel})

def addserreq(request):
    if request.method=="POST":
        
        e_uid=request.session['ename']
        service=request.POST.get('service')
        date=request.POST.get('date')
        location=request.POST.get('location')
        state=request.POST.get('state')
        phone=request.POST.get('phone')
        message=request.POST.get('message')

        cus=servicerequest(state=state,uid=0,e_uid=e_uid,service=service,date=date,location=location,phone=phone,message=message,status='pending')
        cus.save()
    return redirect(view_emergencyservice)

def addserreq_user(request):
    if request.method=="POST":
        
        uid=request.session['uname']
        service=request.POST.get('service')
        date=request.POST.get('date')
        location=request.POST.get('location')
        state=request.POST.get('state')
        phone=request.POST.get('phone')
        message=request.POST.get('message')

        cus=servicerequest(state=state,uid=uid,e_uid=0,service=service,date=date,location=location,phone=phone,message=message,status='pending')
        cus.save()
    return redirect(view_emergencyservice)

def profile(request):
    user=request.session['uid']
    sel=userregg.objects.filter(id=user)  
    return render(request,'profile.html',{'result':sel})

def userproupdt(request,id):
    xy=request.session['uid']
    xyz=userregg.objects.get(id=xy)   
    return render(request,'proupdt.html',{'result':xyz})

def pupdate(request,id):
  if request.method=='POST':
    name=request.POST.get('name')
    email=request.POST.get('email')
    phone=request.POST.get('phone')
    address=request.POST.get('address')
    password=request.POST.get('password')
    sp=userregg(name=name,email=email,phone=phone,address=address,password=password,id=id)
    sp.save()
    return redirect(profile)
  
def emcservices(request):
    return render(request,'emergencyser.html')

def addemcservices(request):
    if request.method=="POST":
        uid=request.session['uname']
        #number=request.session['number']
        state=request.POST.get('state')
        District=request.POST.get('District')
        city=request.POST.get('city')
        maplink=request.POST.get('maplink')
        category=request.POST.get('category')
        intensity=request.POST.get('intensity')
        service=request.POST.get('service')
        message=request.POST.get('message')
        if 'image' in request.FILES:
            myfile = request.FILES['image']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
        else:
            filename = None
       

        cus=emc_servicerequest(maplink=maplink,state=state,District=District,city=city,category=category,uid=uid,e_uid=0,intensity=intensity,image=filename,message=message,service=service,status='pending')
        cus.save()
    return render(request,'index.html', {'message4':'successfully Registered'})

def addemcservices2(request):
    if request.method=="POST":
        e_uid=request.POST.get('name')
        number=request.POST.get('number')
        state=request.POST.get('state')
        District=request.POST.get('District')
        city=request.POST.get('city')
        maplink=request.POST.get('maplink')
        category=request.POST.get('category')
        intensity=request.POST.get('intensity')
        service=request.POST.get('service')
        message=request.POST.get('message')
        if 'image' in request.FILES:
            myfile = request.FILES['image']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
        else:
            filename = None
       

        cus=emc_servicerequest(maplink=maplink,state=state,District=District,city=city,category=category,uid=0,e_uid=e_uid,intensity=intensity,image=filename,message=message,service=service,status='pending')
        cus.save()
    return render(request,'index.html', {'message4':'successfully Registered'})

def viewvol(request):
    sel=volregg.objects.all()
    return render(request,'viewvolunteer.html',{'res':sel})
def search(request):
    if request.method == "POST":
        title = request.POST.get('title')
        print(title)
     
        crp = volregg.objects.filter(Q(address__icontains=title))
        return render(request,'viewvolunteer.html', {'res': crp})
    else:
        crp = volregg.objects.all()
        return render(request,'viewvolunteer.html', {'res': crp})
def removevol(request,id):
    sel=volregg.objects.get(id=id)
    sel.delete()
    return redirect(viewvol)

def viewusers(request):
    sel=userregg.objects.all()
    return render(request,'viewusers.html',{'res':sel})

def removeuser(request,id):
    sel=userregg.objects.get(id=id)
    sel.delete()
    return redirect(viewusers)

def viewservice(request):
    sel=services.objects.all()
    return render(request,'viewservice.html',{'result':sel})

def removeser(request,id):
    sel=services.objects.get(id=id)
    sel.delete()
    return redirect(viewservice)

def srreqsts(request):
    sel=servicerequest.objects.filter(uid__gt=0)
    return render(request,'viewserreqs.html',{'result':sel})

def emc_srreqsts(request):
    sel1=emc_servicerequest.objects.filter(e_uid__gt=0)
    sel2=emc_servicerequest.objects.filter(uid__gt=0)
    return render(request,'viewserreqs_emc.html',{'result1':sel1,'result2':sel2})

def emc_srreqsts_user(request):
    sel1=emc_servicerequest.objects.filter(e_uid__gt=0,category='Public')
    sel2=emc_servicerequest.objects.filter(uid__gt=0,category='Public')
    return render(request,'viewserreqs_emc.html',{'result1':sel1,'result2':sel2})

def report(request,id):
    sel=emc_servicerequest.objects.get(id=id)
    sel.delete()
    return render(request,'index.html',{'message7':'successfully Reported to the Disaster Authority'})

def assignreq(request,id):
    sel=servicerequest.objects.get(id=id)
    a=sel.service
    b=sel.location
    sel1=volregg.objects.filter(service=a,address=b)
    return render(request,'reqassign.html',{'result':sel,'res':sel1})

def addassignreq(request,id):
    if request.method=="POST":
        date=request.POST.get('date')
        volunteer=request.POST.get('volunteer')
        req_id=request.POST.get('req_id')
        issue=request.POST.get('issue')
        location=request.POST.get('location')
        phone=request.POST.get('phone')
        uid=request.POST.get('uid')
        cus=assign_request(uid=uid,e_uid=0,date=date,volunteer=volunteer,req_id=req_id,issue=issue,location=location,phone=phone,status='pending')
        cus.save()
        sel=servicerequest.objects.get(id=id)
        cus1=servicerequest(uid=sel.uid,e_uid=sel.e_uid,service=sel.service,date=sel.date,location=sel.location,phone=sel.phone,message=sel.message,status='assigned',id=id)
        cus1.save()
    return redirect(srreqsts)

def viewreqst(request):
    user= request.session['vid']
    sel=assign_request.objects.filter(volunteer=user)
    return render(request,'viewvolreqs.html',{'result':sel})

def accept(request,id):
    sel=assign_request.objects.get(id=id)
    a=sel.uid
    b=sel.e_uid
    c=sel.date
    d=sel.volunteer
    e=sel.req_id
    f=sel.issue
    g=sel.location
    h=sel.phone
    upd=assign_request(uid=a,e_uid=b,date=c,volunteer=d,req_id=e,issue=f,location=g,phone=h,status='accepted',id=id)
    upd.save()
    return redirect(viewreqst)

def reject(request,id):
    sel=assign_request.objects.get(id=id)
    a=sel.uid
    b=sel.e_uid
    c=sel.date
    d=sel.volunteer
    e=sel.req_id
    f=sel.issue
    g=sel.location
    h=sel.phone
    upd=assign_request(uid=a,e_uid=b,date=c,volunteer=d,req_id=e,issue=f,location=g,phone=h,status='rejected',id=id)
    upd.save()
    return redirect(viewreqst)

def userreqs(request):
    user= request.session['uname']
    sel=assign_request.objects.filter(uid=user)
    return render(request,'viewuserreqs.html',{'result':sel})

def v_profile(request):
    user=request.session['vid']
    sel=volregg.objects.filter(id=user)
    return render(request,'v_profile.html',{'result':sel})

def v_proupdt(request,id):
    xy=request.session['vid']
    xyz=volregg.objects.get(id=xy)
    return render(request,'v_proupdt.html',{'result':xyz})

def v_pupdate(request,id):
  if request.method=='POST':
    name=request.POST.get('name')
    email=request.POST.get('email')
    phone=request.POST.get('phone')
    address=request.POST.get('address')
    age=request.POST.get('age')
    gender=request.POST.get('gender')
    service=request.POST.get('service')
    password=request.POST.get('password')
    sp=volregg(name=name,email=email,phone=phone,address=address,age=age,gender=gender,service=service,password=password,id=id)
    sp.save()
    return redirect(v_profile)
  
def donation(request):
    return render(request,'donate.html')

def donate(request):
    if request.method=="POST":
        user=request.POST.get('user')
        name=request.POST.get('name')
        typee=request.POST.get('typee')
        phone=request.POST.get('phone')
        quantity=request.POST.get('quantity')
        place=request.POST.get('place')
       

        cus=donations(name=name,typee=typee,quantity=quantity,place=place,phone=phone,uid=user)
        cus.save()
    return render(request,'index.html', {'message8':'successfully Donated'})

def v_donation(request):
    sel=donations.objects.all()
    return render(request,'v_donation.html',{'result':sel})

def camp(request):
    return render(request,'camp.html')

def addcamp(request):
    if request.method=="POST":
        name=request.POST.get('name')
        phone=request.POST.get('phone')
        date=request.POST.get('date')
        place=request.POST.get('place')
        map=request.POST.get('map')
       
        cus=camps(map=map,name=name,date=date,place=place,phone=phone)
        cus.save()
    return render(request,'index.html', {'message9':'successfully Added'})

def v_camp(request):
    sel=camps.objects.all()
    return render(request,'v_camps.html',{'result':sel})

def remove_camp(request,id):
    sel=camps.objects.get(id=id)
    sel.delete()
    return redirect(v_camp)

def add_hospital(request):
    if request.method=="POST":
        name=request.POST.get('name')
        phone=request.POST.get('phone')
        place=request.POST.get('place')
        map=request.POST.get('map')
       
        cus=hospitals(map=map,name=name,place=place,phone=phone)
        cus.save()
        return render(request,'index.html', {'message9':'successfully Added'})
    else:
        return render(request,'add_hospital.html')
    
def v_hos(request):
    sel=hospitals.objects.all()
    return render(request,'v_hos.html',{'result':sel})

def remove_hos(request,id):
    sel=hospitals.objects.get(id=id)
    sel.delete()
    return redirect(v_hos)

def customer_chat(request):
    cus_id = request.session['uid'] 
    cht = chats.objects.filter(cus_id=cus_id)
    return render(request,'customer_chat.html', {'chat': cht,'team':'Admin'})

def addchat_customer(request):
    if request.method == 'POST':
        cus_id = request.session['uid'] 
        message = request.POST.get('message')
        
        ins = chats(cus_id=cus_id, cus_msg=message,admin='admin') 
        ins.save()
                
    return redirect(customer_chat)


def view_chats(request):
    member=userregg.objects.all()
    return render(request,'viewchat.html',{'result':member})

def chat_team(request,id):
    mem_id = userregg.objects.get(id=id)    
    m_id=mem_id.id
    # print (s_id)
    m_name = mem_id.name
    cht = chats.objects.filter(cus_id=m_id, admin='admin')     
    return render(request,'team_chat.html', {'chat': cht,'stud':m_name,'student':m_id})

def addchat_admin(request):
    if request.method == 'POST':
        message = request.POST.get('message')
        mem_id = request.POST.get('mem_id')

        ins = chats(cus_id=mem_id, admin_msg=message,admin='admin') 
        ins.save()
   
        return redirect('chat_team', id=mem_id)