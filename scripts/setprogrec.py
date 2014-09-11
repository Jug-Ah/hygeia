from dosql import *
from bmi_calc import *
import cgi
import simplejson as json

def index(req, userID, height, weight, age):
	userID = cgi.escape(userID)
	height = int(cgi.escape(height))
	weight = int(cgi.escape(weight))
	age = cgi.escape(age)
	
	bmi = BMI(height, weight)
	status = h_status(bmi)
	
	set = doSql()
	perc = 0 #find a way to create a function that extracts the prev. bmi
	rec = set.execqry("select set_progressrecord('" + userID + "', '" + str(height) + "', '" + str(weight) + "', '" + str(bmi) + "', '" + status + "', '" + str(age) + "', '" + str(perc) + "' );", True)
	result = []
	for a in rec:
		stringed = map(str, a)
		result.append(stringed)

	return json.dumps(result)

