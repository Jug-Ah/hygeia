from dosql import *
import cgi
import simplejson as json

def index(req, username, password):
	username = cgi.escape(username)
	password = cgi.escape(password)
	res = []
	x = doSql()			
	rets = x.execqry("select * from login_check('" + username + "', '" + password + "');", False)[0][0]	
	res.append(rets)
	if rets:	
		id = x.execqry("select userid from useraccount where username = '" + username + "';", True)[0][0]
		res.append(id)
		
	
	
	
	
		
		
		
	
	return json.dumps(res)