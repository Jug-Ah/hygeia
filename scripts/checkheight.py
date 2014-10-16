from dosql import *
import cgi
import simplejson as json

def index(req, userID,height):
	userID = cgi.escape(userID)
	height = cgi.escape(height)
	
	
	x = doSql()
	rets = x.execqry("select height from progressrecord where userID = '" + userID + "';", False)[-1][0]
	
	check = False
	if int(height) >= int(rets):
		check = True
			
	return json.dumps(check)



		