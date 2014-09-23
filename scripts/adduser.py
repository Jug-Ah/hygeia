from dosql import *
import cgi
import simplejson as json

def index(req, username, password, email):
	username = cgi.escape(username)
	password = cgi.escape(password)
	email = cgi.escape(email)
	x = doSql()
	rets = x.execqry("select * from set_useraccount('" + username + "', '" + password + "', '" + email + "');", True)[0][0]
	result = int(rets)

	return json.dumps(result)



	