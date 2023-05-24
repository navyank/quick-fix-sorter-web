
from django.urls import path,include
from . import views
urlpatterns = [

    path('',views.main,name="fp"),
    path('adminhome',views.adminhome,name="adminhome"),
    path('depthome', views.depthome, name="depthome"),
    path('officehome', views.officehome, name="officehome"),
    path('login', views.loginn, name="login"),
    path('viewuser', views.viewuser, name="viewuser"),
    path('adddept', views.adddept, name="adddept"),
    path('insertaddep', views.insertaddep, name="insertaddep"),
    path('addep', views.addep, name="addep"),
    path('addmofficer', views.addmofficer, name="addmofficer"),
    path('insertaddmofficer', views.insertaddmofficer, name="insertaddmofficer"),
    path('addofficer', views.addofficer, name="addofficer"),
    path('viewfeed', views.viewfeed, name="viewfeed"),
    path('viewacomplaint', views.viewacomplaint, name="viewacomplaint"),
    path('blockofficer', views.blockofficer, name="blockofficer"),
    path('blockofficer1/<int:id>', views.blockofficer1, name="blockofficer1"),
    path('blockofficer2/<int:id>', views.blockofficer2, name="blockofficer2"),
    path('viewasscmploff', views.viewasscmploff, name="viewasscmploff"),
    path('updatecmpoff/<int:id>', views.updatecmpoff, name="updatecmpoff"),
    path('insertupdatecmpoff', views.insertupdatecmpoff, name="insertupdatecmpoff"),
    path('viewdcomplaint', views.viewdcomplaint, name="viewdcomplaint"),
    path('assigncomplaintoff/<int:id>', views.assigncomplaintoff, name="assigncomplaintoff"),
    path('checkstatcmp', views.checkstatcmp, name="checkstatcmp"),
    path('viewdoff', views.viewdoff, name="viewdoff"),
    path('changepwd',views.changepwd, name="changepwd"),
    path('changepwd1',views.changepwd1, name="changepwd1"),
    path('insertassigncomplaintoff', views.insertassigncomplaintoff, name="insertassigncomplaintoff"),
    path('editofficer/<int:id>', views.editofficer, name="editofficer"),
    path('inserteditofficer', views.inserteditofficer, name="inserteditofficer"),
    path('editdept/<int:id>', views.editdept, name="editdept"),
    path('deletedept/<int:id>', views.deletedept, name="deletedept"),
    path('inserteditdept', views.inserteditdept, name="inserteditdept"),
    path('deleteofficer/<int:id>', views.deleteofficer, name="deleteofficer"),
    path('forgetpwd', views.forgetpwd, name="forgetpwd"),
    path('insertreason',views.insertreason, name="insertreason"),
    path('searchOComplaint', views.searchOComplaint, name="searchOComplaint"),
    path('searchDComplaint', views.searchDComplaint, name="searchDComplaint"),
    path('getpwd',views.getpwd, name="getpwd"),
    path('reasons/<int:id>', views.reasons, name="reasons"),
    path('viewCmptStatus', views.viewCmptStatus, name="viewCmptStatus"),
    path('searchCDate', views.searchCDate, name="searchCDate"),
    path('logout',views.logout, name="logout"),
    path('deletecomplaint',views.deletecomplaint,name='deletecomplaint'),



    ####webservice####

    path('logincode',views.logincode, name="logincode"),
    path('registration',views.registration, name="registration"),
    path('sendfeedback',views.sendfeedback, name="sendfeedback"),
    path('sendComplaint',views.sendComplaint, name="sendComplaint"),
    path('department', views.department, name="department"),
    path('view_reply_comp', views.view_reply_comp, name="view_reply_comp"),
    path('complaint', views.complaint, name="complaint"),



]
