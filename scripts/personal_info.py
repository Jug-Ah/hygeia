from dosql import *
from bmi_calc import *
import cgi
import simplejson as json


def index(req, userID, fullname, birthday, gender, height, weight):
    userID = cgi.escape(userID)
	fullname = cgi.escape(fullname)
	birthday = cgi.escape(birthday)
	gender = cgi.escape(gender)
	height = int(cgi.escape(height))
	weight = int(cgi.escape(weight))
	
	bmi = BMI(height, weight)
	status = h_status(bmi)
		
    x = doSql()
    rets = x.execqry("select * from set_personalinfo(" + id + " , " + p_fullname + ", " + p_birthday + ", " + p_age + ", " + p_gender + ", " + p_height + ", " + p_weight + ", " + p_bmi + ", " + p_healthStatus + "); ", True)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
 
 
 