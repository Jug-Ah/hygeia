from dosql import *
import cgi
import simplejson as json
import re

def index(req, userID):
	userID = cgi.escape(userID)
	
	get = doSql()
	rec = get.execqry("select * from get_personalfitnessplan('" + userID + "');", False)[0]

	result = []
	for a in rec:
		a = a.split('|')
		stringed = map(str, a)
		result.append(stringed)

	return json.dumps(result)
	
