from django.db import models

# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=50)
    password=models.CharField(max_length=50)
    type=models.CharField(max_length=50)

class users(models.Model):
    lid=models.ForeignKey(login,on_delete=models.CASCADE)
    Fname=models.CharField(max_length=50)
    Lname=models.CharField(max_length=50)
    place=models.CharField(max_length=50)
    post_office=models.CharField(max_length=50)
    pin_code=models.IntegerField()
    phone_number=models.BigIntegerField()
    gender=models.CharField(max_length=50)
    dob=models.DateField()
    email_id=models.CharField(max_length=50)
class dept(models.Model):
    lid = models.ForeignKey(login, on_delete=models.CASCADE)
    deptName=models.CharField(max_length=50)
    details=models.CharField(max_length=50)
    contact_no=models.BigIntegerField()
    email_id=models.CharField(max_length=50)
    place = models.CharField(max_length=50)
    post_office = models.CharField(max_length=50)
    pin_code = models.IntegerField()
class officer(models.Model) :
    lid=models.ForeignKey(login, on_delete=models.CASCADE)
    deptid=models.ForeignKey(dept, on_delete=models.CASCADE)
    Fname=models.CharField(max_length=50)
    Lname=models.CharField(max_length=50)
    place=models.CharField(max_length=50)
    post_office=models.CharField(max_length=50)
    pin_code=models.IntegerField()
    phone_number=models.BigIntegerField()
    gender=models.CharField(max_length=50)
    dob=models.DateField()
    email_id=models.CharField(max_length=50)
class feedback(models.Model) :
    userid=models.ForeignKey(users, on_delete=models.CASCADE)
    feedback=models.CharField(max_length=80)
    date=models.DateField()
class complaints(models.Model):
    userid = models.ForeignKey(users, on_delete=models.CASCADE)
    depid=models.ForeignKey(dept, on_delete=models.CASCADE)
    complaint=models.ImageField(upload_to="comp")
    date=models.DateField()
    latitude=models.CharField(max_length=50)
    altitude=models.CharField(max_length=50)
    current_status=models.CharField(max_length=50)
class assignedcomplaints(models.Model):
    complaintid=models.ForeignKey(complaints, on_delete=models.CASCADE)
    officerid = models.ForeignKey(officer, on_delete=models.CASCADE)
    date = models.DateField()
    status=models.CharField(max_length=50)
class Reason(models.Model):
    complaintid = models.ForeignKey(complaints, on_delete=models.CASCADE)
    date = models.DateField()
    Reason = models.CharField(max_length=60)





