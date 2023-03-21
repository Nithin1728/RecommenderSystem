from django import forms
from django.core import validators
import datetime
from django.utils import timezone

from simple.models import userregistrationmodel, upload, dailystatus


class userregistrationform(forms.ModelForm):
    name = forms.CharField(widget=forms.TextInput(), required=True, max_length=100)
    loginid = forms.CharField(widget=forms.TextInput(), required=True, max_length=100)
    password = forms.CharField(widget=forms.PasswordInput(), required=True, max_length=100)
    gender = forms.ChoiceField(choices=[('female','female'),('male','male')])
    age = forms.CharField(widget=forms.NumberInput(), required=True, max_length=100)
    height = forms.FloatField(required=False, max_value=250, min_value=0, widget=forms.NumberInput(attrs={'id': 'form_homework', 'step': "0.01"}))
    weight = forms.CharField(widget=forms.NumberInput(), required=True, max_length=100)
    email = forms.EmailField(widget=forms.TextInput(), required=True)
    contact = forms.CharField(widget=forms.NumberInput(), required=True, max_length=100,validators=[validators.MaxLengthValidator(10),validators.MinLengthValidator(10)])
    authkey = forms.CharField(widget=forms.HiddenInput(), initial='waiting', max_length=100)
    status = forms.CharField(widget=forms.HiddenInput(), initial='waiting', max_length=100)

    class Meta:
        model = userregistrationmodel
        fields = ['name','loginid','password','gender','age','height','weight','email','contact','authkey','status']



class UploadfileForm(forms.ModelForm):

    class Meta:
        model = upload
        fields = ('filename','description','file')




class dailystatusform(forms.ModelForm):
    name = forms.CharField(widget=forms.TextInput(), required=True, max_length=100)
    excercise = forms.CharField(widget=forms.TextInput(),required=True,max_length=100)
    email = forms.CharField(widget=forms.TextInput(),required=True,max_length=100)
    contact = forms.CharField(widget=forms.NumberInput(),required=True,max_length=100)
    date = forms.DateField(widget=forms.DateInput())
    #duration =  forms.ChoiceField(choices=[('1hour','1hour'),('2hours','2hours'),('3hours','3hours'),('4hours','4hours'),('5hours','5hours'),('6hours','6hours'),('7hours','7hours'),('8hours','8hours'),('9hours','9hours'),('10hours','10hours'),('11hours','11hours'),('12hours','12hours'),('13hours','13hours'),('14hours','14hours'),('15hours','15hours'),('16hours','16hours'),('17hours','17hours'),('18hours','18hours'),('19hours','19hours'),('20hours','20hours')])
    duration = forms.TimeField(widget=forms.TimeInput(format='%H:%M'),required=True)
    caloriesburned = forms.CharField(widget=forms.NumberInput(),required=True,max_length=100)
    class Meta:
        model = dailystatus
        fields = ('name','excercise','email','contact','date','duration','caloriesburned')