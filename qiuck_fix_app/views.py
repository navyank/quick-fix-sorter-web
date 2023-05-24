from datetime import datetime

from django.core.files.storage import FileSystemStorage
from django.http.response import HttpResponse
from django.shortcuts import render
from django.core.mail import send_mail
from newcnn1 import predictcnn

from .models import *


# Create your views here.

def main(request):
    return render(request,"login.html")
def loginn(request):
    uname=request.POST['textfield']
    pwd=request.POST['textfield2']
    try:
        ob=login.objects.get(username=uname,password=pwd)
        if ob.type=="admin":
            request.session['lid']=ob.id
            return HttpResponse("<script>window.location='/adminhome'</script>")
        elif ob.type=="officer":
            request.session['lid'] = ob.id
            return HttpResponse("<script>window.location='/officehome'</script>")
        elif ob.type=="department":
            request.session['lid'] = ob.id
            return HttpResponse("<script>window.location='/depthome'</script>")
        else:
            return HttpResponse("<script>alert('Invalid username or password');window.location='/'</script>")

    except:
        return HttpResponse("<script>alert('Invalid username or password');window.location='/'</script>")

    return render(request,"login.html")
def adminhome(request):
    return render(request,"home page-admin.html")
def depthome(request):
    return render(request,"home page-dept.html")
def officehome(request):
    return render(request,"home page-officer.html")
def viewuser(request):
    ob=users.objects.all()
    return render(request,"View user-Admin.html",{"val":ob})
def adddept(request):
    ob=dept.objects.all()
    return render(request,"Add and manage dept-admin.html",{"val":ob})
def addep (request):
    ob=dept.objects.all()
    return render(request,"Add dept.html",{"val":ob})

def insertaddep (request):
    dname=request.POST['textfield']
    details=request.POST['textarea']
    contact_no=request.POST['textfield2']
    email_id=request.POST['textfield3']
    place=request.POST['textfield4']
    post_office=request.POST['textfield5']
    pin_code=request.POST['textfield6']
    uname=request.POST['textfield7']
    passwd=request.POST['textfield8']

    ob=login()
    ob.username=uname
    ob.password=passwd
    ob.type="department"
    ob.save()

    ob1=dept()
    ob1.lid=ob
    ob1.deptName=dname
    ob1.details=details
    ob1.contact_no=contact_no
    ob1.email_id=email_id
    ob1.place=place
    ob1.post_office=post_office
    ob1.pin_code=pin_code
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/adddept#team'</script>")
def reasons(request,id):
    request.session['cpid']=id
    ob=complaints.objects.get(id=id)
    ob.current_status='rejected'
    ob.save()
    return render(request,"reason of rejection.html")
def insertreason(request):
    reasonss = request.POST['textfield']
    ob1 = Reason()
    ob1.Reason = reasonss
    ob1.date=datetime.today()
    ob1.complaintid=complaints.objects.get(id=request.session['cpid'])
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/viewasscmploff#team'</script>")

def viewCmptStatus(request):
    ob=assignedcomplaints.objects.filter(officerid__lid__id=request.session['lid'],status='completed')
    return render(request, "view completed complain-officert.html",{"val":ob})
def searchCDate(request):
    FromDate = request.POST['textfield']
    ToDate = request.POST['textfield2']
    ob = assignedcomplaints.objects.filter(officerid__lid__id=request.session['lid'],status='completed',complaintid__date__range=(FromDate, ToDate))
    print(ob, "++++++++++++++++++++")
    return render(request, "view completed complain-officert.html", {"val": ob, 'd1': FromDate, 'd2': ToDate})

def addmofficer(request):
    ob=officer.objects.all()
    return render(request,"Add and manage officers-Admin.html",{"val":ob})
def addofficer(request):
    ob=dept.objects.all()
    return render(request,"Add officer.html",{"val":ob})

def insertaddmofficer (request):

    did=request.POST['dp']
    Fname=request.POST['textfield']
    Lname=request.POST['textfield2']
    place=request.POST['textfield6']
    post_office=request.POST['textfield7']
    pin_code=request.POST['textfield8']
    phone_number=request.POST['textfield4']
    gender=request.POST['radiobutton']
    dob=request.POST['textfield3']
    email_id=request.POST['textfield5']
    uname = request.POST['textfield9']
    passwd = request.POST['textfield10']

    ob=login()
    ob.username=uname
    ob.password=passwd
    ob.type="officer"
    ob.save()
    obd=dept.objects.get(id=did)
    ob1=officer()
    ob1.lid=ob
    ob1.deptid=obd
    ob1.Fname=Fname
    ob1.Lname=Lname
    ob1.place=place
    ob1.post_office=post_office
    ob1.pin_code=pin_code
    ob1.phone_number=phone_number
    ob1.gender=gender
    ob1.dob=dob
    ob1.email_id=email_id
    ob1.save()
    return HttpResponse("<script>alert('Inserted successfully');window.location='/addmofficer#team'</script>")

def viewfeed(request):
    ob=feedback.objects.all()
    return render(request,"view feedback-admin.html",{"val":ob})

def viewacomplaint(request):
    ob=complaints.objects.all().order_by('-id')
    return render(request,"view complaint-admin.html",{"val":ob})

def blockofficer(request):
    ob=officer.objects.all()
    return render(request,"Block and unblock officers.html",{"val":ob})


def blockofficer1(request,id):
    ob=login.objects.get(id=id)
    ob.type="block"
    ob.save()
    return HttpResponse("<script>alert('blocked');window.location='/blockofficer#team'</script>")


def blockofficer2(request,id):
    ob=login.objects.get(id=id)
    ob.type="officer"
    ob.save()
    return HttpResponse("<script>alert('unblocked');window.location='/blockofficer#team'</script>")

def viewasscmploff(request):
    ob=assignedcomplaints.objects.filter(officerid__lid__id=request.session['lid']).order_by('-id')
    print(ob,"++++++++")
    return render(request,"view assigned complaint-officers.html",{"val":ob})

def updatecmpoff(request,id):
    ob=complaints.objects.get(id=id)
    request.session['cid']=id
    return render(request,"update complaint status-officer.html",{'val':ob})

def insertupdatecmpoff(request):
    ob=assignedcomplaints.objects.get(complaintid__id=request.session['cid'])
    current_status=request.POST['select']
    ob.status=current_status
    ob.save()
    return HttpResponse("<script>alert('updated successfully');window.location='/viewasscmploff#team'</script>")
def viewdcomplaint(request):
    # ob=complaints.objects.filter(depid__lid__id=request.session['lid']).order_by('-id')
    data = []
    from django.db import connection
    ob=dept.objects.get(lid__id=request.session['lid'])
    cursor = connection.cursor()
    cursor.execute("SELECT `qiuck_fix_app_complaints`.*,`qiuck_fix_app_assignedcomplaints`.`status` FROM `qiuck_fix_app_complaints` LEFT JOIN `qiuck_fix_app_assignedcomplaints` ON `qiuck_fix_app_complaints`.`id`=`qiuck_fix_app_assignedcomplaints`.`complaintid_id` WHERE  `qiuck_fix_app_complaints`.`depid_id`=%s order BY `qiuck_fix_app_complaints`.`id` desc",[ob.id])
    row = cursor.fetchall()
    for i in row:
        reply=i[5]
        status=i[8]
        uob=users.objects.get(id=i[7])
        if reply == "rejected":
            ob=Reason.objects.get(complaintid__id=i[0])
            reply="Rejected.."+"\n Because of "+ob.Reason
        elif reply == "pending":
            reply=reply
        elif reply == "assigned":
            reply=reply
        row = {"complaint": str(i[1]), "date":str(i[2]),"reply":reply,'id':i[0],'status':status,'user':uob.Fname+" "+uob.Lname,"lati":i[3],"longi":i[4]}
        data.append(row)
    return render(request,"view complaint-dept.html",{"val":data})

def assigncomplaintoff(request,id):
    request.session['com_id'] = id
    ob=officer.objects.filter(deptid__lid__id=request.session['lid'])
    ob1=complaints.objects.get(id=id)
    return render(request,"assign complaint to officer.html",{"val":ob,'var':ob1})

def insertassigncomplaintoff(request):

    ob1=complaints.objects.get(id=request.session['com_id'])
    ob1.current_status='assigned'
    ob1.save()
    officerid=request.POST['select']
    ob=assignedcomplaints()
    ob.officerid=officer.objects.get(lid__id=officerid)
    ob.status='pending'
    ob.date=datetime.today()
    ob.complaintid=ob1
    ob.save()
    return HttpResponse("<script>alert('assigned successfully');window.location='/viewdcomplaint#team'</script>")

def checkstatcmp(request):
    print(request.session['lid'])
    ob=assignedcomplaints.objects.filter(complaintid__depid__lid__id=request.session['lid'])
    print(ob,"==============")
    did=request.session['lid']
    return render(request,"check status of complaint.html",{"val":ob,'did':did})

def viewdoff(request):
    ob=officer.objects.filter(deptid__lid__id=request.session['lid'])
    return render(request,"view officer-dept.html",{"val":ob})

def changepwd(request):
    return render(request,"change password.html")
def changepwd1(request):

    cpwd=request.POST['textfield']
    npwd=request.POST['textfield2']
    cnpwd=request.POST['textfield3']
    try:
        ob=login.objects.get(password=cpwd,id=request.session['lid'])
        if ob is not None:
            if npwd == cnpwd:
                ob.password=npwd
                ob.npwd=cnpwd
                ob.save()
                return HttpResponse("<script> alert('password changed  successfully');window.location='/officehome'</script>")
            else:
                return HttpResponse("<script> alert(' password mismatch');window.location='/changepwd#team'</script>")
    except:
        return HttpResponse("<script> alert('incorrect password');window.location='/changepwd#team'</script>")



def editofficer(request,id):
    ob = officer.objects.get(id=id)
    request.session['oid']=ob.id
    return render(request,"edit_officer.html",{'val':ob,'d':str(ob.dob)})


def inserteditofficer (request):


    Fname = request.POST['textfield']
    Lname = request.POST['textfield2']
    place = request.POST['textfield6']
    post_office = request.POST['textfield7']
    pin_code = request.POST['textfield8']
    phone_number = request.POST['textfield4']
    gender = request.POST['radiobutton']
    dob = request.POST['textfield3']
    email_id = request.POST['textfield5']



    ob1 = officer.objects.get(id=request.session['oid'])

    ob1.Fname = Fname
    ob1.Lname = Lname
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.phone_number = phone_number
    ob1.gender = gender
    ob1.dob = dob
    ob1.email_id = email_id
    ob1.save()
    return HttpResponse("<script>alert('edited successfully');window.location='/addmofficer#team'</script>")

def editdept(request,id):
    ob = dept.objects.get(id=id)
    request.session['did']=id
    return render(request,"edit dept.html",{'val':ob})


def inserteditdept(request):
    dname = request.POST['textfield']
    details = request.POST['textarea']
    contact_no = request.POST['textfield2']
    email_id = request.POST['textfield3']
    place = request.POST['textfield4']
    post_office = request.POST['textfield5']
    pin_code = request.POST['textfield6']

    ob1 = dept.objects.get(id=request.session['did'])

    ob1.deptName = dname
    ob1.details = details
    ob1.contact_no = contact_no
    ob1.email_id = email_id
    ob1.place = place
    ob1.post_office = post_office
    ob1.pin_code = pin_code
    ob1.save()
    return HttpResponse("<script>alert('edited successfully');window.location='/adddept#team'</script>")

def deletedept(request,id):
    ob = dept.objects.get(id=id)
    ob.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/adddept#team'</script>")

def deleteofficer(request,id):
    ob = officer.objects.get(id=id)
    ob.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/addmofficer#team'</script>")



# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_HOST = 'quickfixsorter123@gmail.com'
# EMAIL_PORT = 587
# EMAIL_USE_TLS = True
# EMAIL_HOST_USER = 'your_username'
# EMAIL_HOST_PASSWORD = 'rtjlzehtqytswkwd'
def forgetpwd(request):
   return render(request, "forget password.html")
def getpwd(request):
    print(request.POST)
    username=request.POST['textfield']
    email_id=request.POST['textfield2']
    g = login.objects.get(username=username)
    if g is not None:
        send_mail('CREDITCARD FRAUD DETECTION', "YOUR NEW PASSWORD IS  -" + g.password, 'email@gmail.com', [email_id],
                  fail_silently=False)
        return HttpResponse("<script>alert('send successfully..');window.location='/forgetpwd'</script>")
    else:
        return HttpResponse("<script>alert('invalid username or email_id');window.location='/forgetpwd'</script>")

# ob=dept.objects.filter(email_id=email_id,lid__username=username)
    # if len(ob)==1:
    #     # mail code
    #     return HttpResponse("<script>alert('check your registered email for password');window.location='/'</script>")
    # else:
    #     ob = officer.objects.filter(email_id=email_id, lid__username=username)
    #     if len(ob)==1:
    #         return HttpResponse("<script>alert('check your registered email for password');window.location='/'</script>")
    #     else:
    #         return HttpResponse("<script>alert('invalid username or email_id');window.location='/forgetpwd'</script>")
def searchOComplaint(request):

    FromDate = request.POST['textfield']
    ToDate = request.POST['textfield2']
    ob=assignedcomplaints.objects.filter(officerid__lid__id=request.session['lid'],complaintid__date__range=(FromDate,ToDate))
    print(ob,"++++++++++++++++++++")
    return render(request,"view assigned complaint-officers.html",{"val":ob,'d1':FromDate,'d2':ToDate})
def searchDComplaint(request):

    FromDate = request.POST['textfield']
    ToDate = request.POST['textfield2']
    ob = complaints.objects.filter(depid__lid__id=request.session['lid'],date__range=(FromDate,ToDate))
    print(ob,"++++++++++++++++++++")
    return render(request,"view complaint-dept.html",{"val":ob,'d1':FromDate,'d2':ToDate})



def logout(request):
    return HttpResponse("<script>alert('do you want to logout');window.location='/'</script>")




#################################################################webservice######################################
from django.core import serializers
import json
from django.http import JsonResponse

def logincode(request):
     print(request.POST)
     un=request.POST['uname']
     pwd=request.POST['pass']
     print(un,pwd)
     try:
         users = login.objects.get(username=un,password=pwd)


         if users is None:
                data = {"task": "invalid"}
         else:
                print("in user function")
                data = {"task":"valid","id":users.id}
         r = json.dumps(data)
         print (r)
         return HttpResponse(r)
     except:
         data = {"task": "invalid"}
         r = json.dumps(data)
         print(r)
         return HttpResponse(r)

def registration(request):
    Fname=request.POST['Fname']
    Lname=request.POST['Lname']
    place= request.POST['place']
    post_office = request.POST['post']
    pin_code = request.POST['pin_code']
    phone = request.POST['phone_number']
    gender = request.POST['gender']
    dob = request.POST['dob']
    email_id = request.POST['email_id']
    uname = request.POST['username']
    passwd = request.POST['password']

    lob = login()
    lob.username = uname
    lob.password = passwd
    lob.type = 'user'
    lob.save()

    userob = users()
    userob.Fname = Fname
    userob.Lname = Lname
    userob.place = place
    userob.post_office = post_office
    userob.pin_code = pin_code
    userob.phone_number = phone
    userob.gender = gender
    userob.dob = dob
    userob.email_id = email_id
    userob.lid=lob
    userob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)
def deletecomplaint(request):
    cid=request.POST['cid']
    ob=complaints.objects.get(id=cid)
    ob.delete()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def sendfeedback(request):
    lidd=request.POST['lid']
    feedbacks=request.POST['feedback']
    feed=feedback()
    date = datetime.today()
    feed.feedback=feedbacks
    feed.date=date
    feed.userid=users.objects.get(lid__id=lidd)
    feed.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def sendComplaint(request):
    lid = request.POST['lid']
    latitude1 = request.POST['latitude']
    altitude2 = request.POST['longitude']
    print(latitude1, altitude2,"********************************************")
    file1 = request.FILES['pic']
    print(file1,lid,"==================")
    fp = FileSystemStorage()
    fs = fp.save(file1.name, file1)
    print(fs)
    res = predictcnn(r'C:\Users\user\OneDrive\Desktop\Quick sort\quick_fix_sorter\media\\'+fs)
    print(res,"eeeeeeeeeeeeeeeeeee")
    if res[0]==0:
        dep="3"
    elif res[0]==1:
        dep="2"
    elif res[0]==2:
        dep="7"
    elif res[0]==3:
        dep="invalid"
    elif res[0]==4:
        dep="6"
    elif res[0]==5:
        dep="4"
    else:
        dep="invalid"
    if dep != "invalid":
        ob=complaints()
        ob.complaint=fs
        date= datetime.today()
        ob.date=date
        ob.userid = users.objects.get(lid__id=lid)
        ob.latitude=latitude1
        ob.altitude=altitude2
        ob.current_status='pending'
        ob.depid=dept.objects.get(id=dep)
        ob.save()
        data = {"task": "success"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    else:
        data = {"task": "Invalid Image"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
def  department(request):
    ob = dept.objects.all()
    data = []
    for i in ob:
        row = {"deptname": i.deptName, "deptid": i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def complaint(request):
    uid=request.POST['lid']
    did=request.POST['depid']
    lat=request.POST['lati']
    longi=request.POST['longi']
    file=request.FILES['file']
    fp=FileSystemStorage()
    fs=fp.save(file.filename,file)
    ob=complaints()
    ob.userid=users.objects.get(lid__id=uid)
    ob.depid=dept.objects.get(id=did)
    ob.complaint=fs
    ob.date=datetime.today()
    ob.current_status='pending'
    ob.latitude=lat
    ob.altitude=longi
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def view_reply_comp(request):
    lid=request.POST['lid']
    data = []
    from django.db import connection
    ob=users.objects.get(lid__id=lid)
    cursor = connection.cursor()
    cursor.execute("SELECT `qiuck_fix_app_complaints`.*,`qiuck_fix_app_assignedcomplaints`.`status` FROM `qiuck_fix_app_complaints` LEFT JOIN `qiuck_fix_app_assignedcomplaints` ON `qiuck_fix_app_complaints`.`id`=`qiuck_fix_app_assignedcomplaints`.`complaintid_id` WHERE  `qiuck_fix_app_complaints`.`userid_id`=%s order BY `qiuck_fix_app_complaints`.`id` desc",[ob.id])
    row = cursor.fetchall()
    for i in row:
        reply=i[5]
        status=i[8]
        if reply == "rejected":
            ob=Reason.objects.get(complaintid__id=i[0])
            reply="Rejected.."+"\n Because of "+ob.Reason
        elif reply == "pending":
            reply=reply
        elif reply == "assigned":
            reply=reply +"\n"+status
        row = {"complaint": str(i[1]), "date":str(i[2]),"reply":reply,'id':i[0],'status':status}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)




























