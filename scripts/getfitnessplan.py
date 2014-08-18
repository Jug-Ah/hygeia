from dosql_g import *
import cgi
import simplejson as json

def index(req, gender, age_bracket, health_bracket):
    gender = cgi.escape(gender)
    age_bracket = cgi.escape(age_bracket)
    health_bracket = cgi.escape(health_bracket)
    x = doSql()
    rets = x.execqry("select * from get_fitness_plan('" + gender + "', '" + age_bracket + "', '" + health_bracket + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
