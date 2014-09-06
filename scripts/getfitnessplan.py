from dosql_g import *
import cgi
import simplejson as json

def index(req, gender, ageBracket, healthBracket):
    gender = cgi.escape(gender)
    age_bracket = cgi.escape(ageBracket)
    health_bracket = cgi.escape(healthBracket)
    x = doSql()
    rets = x.execqry("select * from get_fitness_plan('" + gender + "', '" + ageBracket + "', '" + healthStatus + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
