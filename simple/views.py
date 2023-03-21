import csv
from collections import defaultdict
from io import TextIOWrapper
from random import randint

from django.contrib import messages
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect

from simple.forms import userregistrationform, UploadfileForm
from simple.models import userregistrationmodel, excercisesdata

from user.algorithms.anntest import NeuralNetwork
import numpy as np
import random
from user.algorithms.LogisticRegressionTest import runLogisticAlgo



def index(request):
    return render(request,"index.html")

def userregistration(request):
    if request.method == 'POST':
        form = userregistrationform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'you are successfully registred')
            return HttpResponseRedirect('user')
        else:
            print('Invalid')

    else:
        form = userregistrationform()
    return render(request,"user/userregistration.html",{'form':form})


def user(request):
    context={}
    return render(request,'user/user.html',context)


def adminlogin(request):
    return render(request,"admin/adminlogin.html")

def adminloginaction(request):
    if request.method == "POST":
        #if request.method == "POST":
            usid = request.POST.get('username')
            pswd = request.POST.get('password')
            if usid == 'admin' and pswd == 'admin':
                return render(request,'admin/adminhome.html')
            else:
                messages.success(request, 'Invalid user id and password')
    #messages.success(request, 'Invalid user id and password')
    return render(request,'adminlogin.html')


def adminbase(request):
    return render(request,"adminbase.html")

def adminhome(request):

    return render(request,'admin/adminhome.html')


def viewadminuserpage(request):
    userdata = userregistrationmodel.objects.all()
    return render(request,'admin/viewuserdata.html',{'object':userdata})

def activateusers(request):
    if request.method == 'GET':
        usid = request.GET.get('pid')
        authkey = random_with_N_digits(8)
        status = 'activated'
        print("USID = ",usid,authkey,status)
        userregistrationmodel.objects.filter(id=usid).update(authkey=authkey , status=status)
        userdata = userregistrationmodel.objects.all()
        return render(request,'admin/viewuserdata.html',{'object':userdata})

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

def logout(request):
    return render(request,'index.html')


def uploadfile(request):
    if request.method == 'POST':
        form = UploadfileForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('index.html')
    else:
        form = UploadfileForm()
    return render(request, 'fas/uploadfile.html', {'form': form})


def storecsvdata(request):
    if request.method == 'POST':
        #age = request.POST.get('age')
        #weight = request.POST.get('weight')
        csvfile = TextIOWrapper(request.FILES['file'])
        print(csvfile)
        columns = defaultdict(list)

        storecsvdata = csv.DictReader(csvfile)
        # row1 = next(storecsvdata)
        for row1 in storecsvdata:
            age = row1["age"]
            weight = row1["weight"]
            excercise1 = row1["excercise1"]
            excercise2 = row1["excercise2"]
            diet = row1["diet"]

            excercisesdata.objects.create(age=age, weight=weight, excercise1=excercise1,
                                            excercise2=excercise2, diet=diet)

        print("Name is ", csvfile)
        return HttpResponse('CSV file successful uploaded')
    else:

        return render(request, 'fas/uploadfile.html', {})



def faslogin(request):
    return render(request,"fas/faslogin.html")

def fasloginaction(request):
    if request.method == "POST":
        #if request.method == "POST":
            usid = request.POST.get('username')
            pswd = request.POST.get('password')
            if usid == 'fas' and pswd == 'fas':
                return render(request,'fas/fashome.html')
            else:
                messages.success(request, 'Invalid user id and password')
    #messages.success(request, 'Invalid user id and password')
    return render(request,'fas/faslogin.html')

def fashome(request):
    return render(request,"fas/fashome.html")

def faspredection(request):
    dict = {}
    listUsers = userregistrationmodel.objects.all()
    dataLlist = []
    idlist = []
    for users in listUsers:
        list = []
        userid = users.loginid
        v0 = int(users.id % 2)
        if v0 == 0:
            idlist.append(0)
        else:
            idlist.append(1)
        # idlist.append(users.id)
        # print('Registerd users = ',userid)
        heightandweight = userregistrationmodel.objects.get(loginid=userid)
        # print(heightandweight.age)
        age = heightandweight.age
        height = heightandweight.height
        weight = heightandweight.weight
        v1 = int(int(age) % 2)
        print("V1 == ", v1)
        if v1 == 0:
            list.append(0)
        else:
            list.append(1)
        # list.append(age)
        v2 = int(int(height) % 2)
        if v2 == 0:
            list.append(0)
        else:
            list.append(1)
        # list.append(height)
        v3 = int(int(weight) % 2)
        if v3 == 0:
            list.append(0)
        else:
            list.append(1)
        # list.append(weight)
        dataLlist.append(list)
    neural_network = NeuralNetwork()
    print("Beginning Randomly Generated Weights: ")
    dict.update({"genweight": neural_network.synaptic_weights})
    list = [[0, 0, 1], [1, 1, 1], [1, 0, 1], [0, 1, 1]]
    # training data consisting of 4 examples--3 input values and 1 output
    print("Trainfin Dataset ", dataLlist)
    print("Test Dataset ", idlist)
    training_inputs = np.array(dataLlist)
    # training_outputs = np.array([[0, 1, 1, 0]]).T
    training_outputs = np.array([idlist]).T
    # training taking plac
    neural_network.train(training_inputs, training_outputs, 15000)
    print("Ending Weights After Training: ")
    dict.update({"aftrtraining": neural_network.synaptic_weights})
    pathList = [0, 1]
    user_input_one = random.choice(pathList)  # str(input("User Input One: "))
    user_input_two = random.choice(pathList)  # str(input("User Input Two: "))
    user_input_three = random.choice(pathList)  # str(input("User Input Three: "))

    dict.update({"newsiut": [user_input_one, user_input_two, user_input_three]})
    print("New Output data: ")
    dict.update({'result': neural_network.think(np.array([user_input_one, user_input_two, user_input_three]))})
    print("Its Done ")
    lgdict = runLogisticAlgo()
    return render(request, 'fas/faspredectiontest.html', {'dict': dict, 'lgdict': lgdict})

