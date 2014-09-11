from dosql import *
import cgi
import simplejson as json

def index(req, username, password, email):
	username = cgi.escape(username)
	password = cgi.escape(password)
	email = cgi.escape(email)
	x = doSql()
	rets = x.execqry("select * from set_useraccount('" + username + "', '" + password + "', '" + email + "');", True)
	result = []
	for ret in rets:
		stringed = map(str, ret)
		result.append(stringed)

	return json.dumps(result)



	