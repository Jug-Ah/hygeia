from dosql import *
import cgi
import simplejson as json


def index(req, userID):
	userID = cgi.escape(userID)
	
	x = doSql()
	ret = []
	res = x.execqry("select * from personalinfo where userid = '" + userID + "';", True)
	ret.append(res)
	
	res = x.execqry("select email from useraccount where userid = '" + userID + "';", True)
	ret.append(res)

	
	

	return json.dumps(ret)