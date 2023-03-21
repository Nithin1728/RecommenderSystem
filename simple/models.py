from django.db import models


class userregistrationmodel(models.Model):
    name = models.CharField(max_length=100)
    loginid = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    gender = models.CharField(max_length=100)
    age = models.CharField(max_length=100)
    height = models.FloatField()
    weight = models.CharField(max_length=100)
    email = models.EmailField()
    contact = models.CharField(max_length=100)
    authkey = models.CharField(max_length=100)
    status = models.CharField(max_length=100)

def __str__(self):
    return self.email


class upload(models.Model):
    #uuid = models.CharField(max_length=30)
    filename = models.CharField(max_length=100)
    description = models.CharField(max_length=100,blank=True)
    file = models.FileField(upload_to='files/pdfs/')

    def __str__(self):
        return self.filename
    def delete(self, *args, **kwargs):
        self.file.delete()
        super().delete(*args,**kwargs)


class excercisesdata(models.Model):
    age = models.CharField(max_length=500)
    weight = models.CharField(max_length=300)
    excercise1 = models.CharField(max_length=300)
    excercise2 = models.CharField(max_length=300)
    diet = models.CharField(max_length=255)


    def __str__(self):
        return self.excercise1


class dailystatus(models.Model):
    name = models.CharField(max_length=100)
    excercise = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    contact = models.FloatField(max_length=100)
    date = models.DateField(max_length=50)
    duration = models.CharField(max_length=50)
    caloriesburned = models.CharField(max_length=100)

    class Meta:
        unique_together = ('name', 'date',)


    def __str__(self):
        return self.email




