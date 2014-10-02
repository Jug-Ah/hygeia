from dosql import *
import cgi
import simplejson as json

def index(req, username, password):
	username = cgi.escape(username)
	password = cgi.escape(password)
	
	x = doSql()			
	rets = x.execqry("select * from login_check('" + username + "', '" + password + "');", False)[0][0]	
	return json.dumps(rets)