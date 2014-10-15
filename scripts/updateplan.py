from dosql import *
import cgi
import simplejson as json

def index(req, userID):
	userID = cgi.escape(userID)
	
	set = doSql()
	
	gender = set.execqry("select gender from personalinfo where userID = " + userID + ";", False)[-1][0]
	age_bracket = set.execqry("select agebracket from progressrecord where userid = " + userID + ";", False)[-1][0]
	health_bracket = set.execqry("select healthstatus from progressrecord where userid = " + userID + ";", False)[-1][0]
	
	exercise_plan = set.execqry("select exerciseplan from fitnessplan where gender = '" + gender + "' and agebracket = '" + age_bracket + "' and healthstatus = '" + health_bracket + "';", False)[0][0]
	diet_plan = set.execqry("select dietplan from fitnessplan where gender = '" + gender + "' and agebracket = '" + age_bracket + "' and healthstatus = '" + health_bracket + "';", False)[0][0]
	
	rec = set.execqry("select update_personalfitnessplan('" + userID + "', '" + diet_plan + "', '" + exercise_plan + "');", True)
	result = []
	for a in rec:
		stringed = map(str, a)
		result.append(stringed)

	return json.dumps(result)
