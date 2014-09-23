from dosql import *
from bmi_calc import *
import cgi
import simplejson as json


def index(req, userID, fullname, birthday, gender):
	userID = cgi.escape(userID)
	fullname = cgi.escape(fullname)
	birthday = cgi.escape(birthday)
	gender = cgi.escape(gender)
		
	x = doSql()
	rets = x.execqry("select * from set_personalinfo('" + userID + "', '" + fullname + "', '" + birthday + "', '" + gender + "');", True)
	result = []
	for ret in rets:
		stringed = map(str, ret)
		result.append(stringed)

	return json.dumps(result)
 
 
 