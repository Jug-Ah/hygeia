<<<<<<< HEAD
from dosql import *
import cgi
import math
try:
    import json
except ImportError:
    import simplejson as json
=======
from dosql_g import *
import cgi
import simplejson as json

>>>>>>> 15afc79a86b6634998fefb6b4e4d858c813b9775

def index(req, height, weight, age):
    height = cgi.escape(height)
	weight = cgi.escape(weight)
	age = cgi.escape(age) 
	
	b = bmi(height, weight)
	s = status(b)
	perc = 
	
    x = doSql()
	#id is soon procured from useraccount.sql table
    rec = x.execqry("select setprogressrecord('" + height + "', '" + weight + "', '" + b + "', '" + s + "', '" + age + "', '" + perc + "' );", True)
    result = []
    for a in rec:
        stringed = map(str, a)
        result.append(stringed)

    return json.dumps(result)

#import this two functions from personalinfo.py once acquired	
def bmi(height, weight):
   return weight/ (height * height)
   
def status(bmi):	
   if bmi < 18.50:  
     return "underweight"
   elif bmi >= 18.50 && bmi <= 24.99
     return "normal"
   elif bmi > 24.99:
     return "overweight"

def change_perc(c_bmi, p_bmi)