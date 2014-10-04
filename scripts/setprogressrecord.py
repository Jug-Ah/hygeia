from dosql import *
from bmi_calc import *
import cgi
import simplejson as json

def index(req, userID, height, weight):
	userID = cgi.escape(userID)
	height = int(cgi.escape(height))
	weight = int(cgi.escape(weight))
	
	bmi = BMI(height, weight)
	status = h_status(bmi)
	
	set = doSql()
	perc = 0 #find a way to create a function that extracts the prev. bmi
	birthday = set.execqry("select birthday from personalinfo where userID = " + userID + ";", False)[0][0]
	age = set.execqry("select extract(year from age(timestamp '" + birthday + "'));", False)[0][0]
	
	agebracket = bracket(int(age))
	
	rec = set.execqry("select set_progressrecord('" + userID + "', '" + str(height) + "', '" + str(weight) + "', '" + str(bmi) + "', '" + status + "', '" + str(int(age)) + "', '" + agebracket + "', '" + str(perc) + "' );", True)
	result = []
	for a in rec:
		stringed = map(str, a)
		result.append(stringed)

	return json.dumps(result)

