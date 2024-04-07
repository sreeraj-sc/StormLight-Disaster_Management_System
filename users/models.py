from django.db import models

# Create your models here.

class userregg(models.Model):
    name=models.CharField(max_length=150)
    email=models.CharField(max_length=150)
    address=models.CharField(max_length=150)
    phone=models.CharField(max_length=150)
    password=models.CharField(max_length=150)

class services(models.Model):
    name=models.CharField(max_length=150)

class volregg(models.Model):
    name=models.CharField(max_length=150)
    email=models.CharField(max_length=150)
    address=models.CharField(max_length=150)
    state=models.CharField(max_length=150)
    phone=models.CharField(max_length=150)
    age=models.CharField(max_length=150)
    gender=models.CharField(max_length=150)
    service=models.CharField(max_length=150)
    password=models.CharField(max_length=150)

class emergency(models.Model):
    name=models.CharField(max_length=150)
    password=models.CharField(max_length=150)

class servicerequest(models.Model):
    uid=models.CharField(max_length=150)
    e_uid=models.CharField(max_length=150)
    service=models.CharField(max_length=150)
    location=models.CharField(max_length=150)
    state=models.CharField(max_length=150)
    phone=models.CharField(max_length=150)
    date=models.CharField(max_length=150)
    message=models.CharField(max_length=150)
    status=models.CharField(max_length=150)
    

class emc_servicerequest(models.Model):
    uid=models.CharField(max_length=150)
    e_uid=models.CharField(max_length=150)
    #number=models.CharField(max_length=150, null=True, blank=True)
    state=models.CharField(max_length=150)
    District=models.CharField(max_length=150, default="unknown")
    city=models.CharField(max_length=150, default="unknown")
    state=models.CharField(max_length=150)
    maplink=models.CharField(max_length=150)
    intensity=models.CharField(max_length=150)
    image=models.CharField(max_length=150, null=True, blank=True)
    message=models.CharField(max_length=150)
    service=models.CharField(max_length=150)
    status=models.CharField(max_length=150)
    category=models.CharField(max_length=150)
    ip_contry=models.CharField(max_length=150, default='')
    ip_regionName=models.CharField(max_length=150, default='')
    ip_city=models.CharField(max_length=150, default='')
    ip_zip=models.CharField(max_length=150, default='')
    ip_lat=models.CharField(max_length=150, default='')
    ip_lon=models.CharField(max_length=150, default='')
    ip_ipaddr=models.CharField(max_length=150, default='')


class assign_request(models.Model):
    uid=models.CharField(max_length=150)
    e_uid=models.CharField(max_length=150)
    date=models.CharField(max_length=150)
    volunteer=models.CharField(max_length=150)
    req_id=models.CharField(max_length=150)
    issue=models.CharField(max_length=150)
    location=models.CharField(max_length=150)
    phone=models.CharField(max_length=150)
    status=models.CharField(max_length=150)

class donations(models.Model):
    name=models.CharField(max_length=150)
    typee=models.CharField(max_length=150)
    quantity=models.CharField(max_length=150)
    phone=models.CharField(max_length=150)
    place=models.CharField(max_length=150)
    uid=models.CharField(max_length=150)


class camps(models.Model):
    name=models.CharField(max_length=150)
    date=models.CharField(max_length=150)
    phone=models.CharField(max_length=150)
    place=models.CharField(max_length=150)
    map=models.CharField(max_length=1000)
class hospitals(models.Model):
    name=models.CharField(max_length=150)
    phone=models.CharField(max_length=150)
    place=models.CharField(max_length=150)
    map=models.CharField(max_length=1000)

class chats(models.Model):
    cus_id=models.CharField(max_length=150)
    admin=models.CharField(max_length=150)
    cus_msg=models.CharField(max_length=150)
    admin_msg=models.CharField(max_length=150)