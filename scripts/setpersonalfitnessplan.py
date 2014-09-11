from dosql_a import *
import cgi
import simplejson as json


def index(req, userId, age, gender, healthstatus):
    userId = cgi.escape(userId)
	age = cgi.escape(age)
	gender = cgi.escape(gender)
	healthstatus = cgi.escape(healthstatus)
	
	age = agebracket(int(age))
	
	
    x = doSql()
	personalDietPlan = x.execqry()
	personalExercisePlan = x.execqry()
	
    rets = x.execqry("select set_personalfitnessplan('" + userId +"', '" + personalDietPlan + "', '"  + personalExercisePlan + "');", True)
	
    for ret in rets:
        stringed = map(str, ret)

    return json.dumps(result)
	
def agebracket(age):
    if age >= 12 and age <= 19:
	    return 'teen'
	elif age >= 20 and age <= 29:
	    return 'young_adult'
    elif age >= 30 and age <= 50:
	    return 'adult'
