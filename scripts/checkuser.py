from dosql import *
import cgi
import simplejson as json

def index(req, username):
	username = cgi.escape(username)

	x = doSql()
	rets = x.execqry("select not exists(select username from useraccount where username = '" + username + "');", False)[0][0]
	
	return json.dumps(rets)



		