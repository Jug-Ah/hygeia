from dosql import *
import cgi
import simplejson as json


def index(req, userID):
	userID = cgi.escape(userID)
	
	x = doSql()	
	res = x.execqry("select personalinfo.fullname, personalinfo.birthday, personalinfo.gender, useraccount.email FROM personalinfo, useraccount where personalinfo.userid = '" + userID + "' and useraccount.userid ='" + userID + "';", True)	

	result = []
	for a in res:
		stringed = map(str, a)
		result.append(stringed)

	return json.dumps(result)
	