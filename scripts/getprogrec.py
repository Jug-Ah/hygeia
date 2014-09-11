from dosql_g import *
import cgi
import simplejson as json

def index(req, userID):
	userID = cgi.escape(userID)
	
	get = doSql()
	rec = get.execqry("select get_progressrecord('" + userID + "');", False)
	result = []
	for a in rec:
		stringed = map(str, a)
		result.append(stringed)
		
	return json.dumps(result)