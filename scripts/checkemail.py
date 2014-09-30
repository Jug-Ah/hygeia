from dosql import *
import cgi
import simplejson as json

def index(req, email):
	email = cgi.escape(email)

	x = doSql()
	rets = x.execqry("select not exists(select email from useraccount where email = '" + email + "');", False)[0][0]
	
	return json.dumps(rets)