from dosql_g import *
import cgi
import simplejson as json

def index(req, username, password):
	username = cgi.escape(username)
	password = cgi.escape(password)    
	x = doSql()
	rets = x.execqry("select * from set_useraccount('" + username + "', '" + password + "');", True)
	result = []
	for ret in rets:
		stringed = map(str, ret)
		result.append(stringed)

	return json.dumps(result)



	