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
	
	birthday = set.execqry("select birthday from personalinfo where userID = " + userID + ";", False)[0][0]
	age = set.execqry("select extract(year from age(timestamp '" + birthday + "'));", False)[0][0]
	prev_bmi = set.execqry("select bmi from progressrecord where userID = " + userID + ";", False)[-1][0]
	perc = change_perc(float(bmi), float(prev_bmi))
	
	agebracket = bracket(int(age))
	
	rec = set.execqry("select set_progressrecord('" + userID + "', '" + str(height) + "', '" + str(weight) + "', '" + str(bmi) + "', '" + status + "', '" + str(int(age)) + "', '" + agebracket + "', '" + str(perc) + "' );", True)
	result = []
	for a in rec:
		stringed = map(str, a)
		result.append(stringed)

	return json.dumps(result)

