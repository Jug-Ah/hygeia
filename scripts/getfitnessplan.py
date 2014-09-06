from dosql_j import *
import cgi
import simplejson as json

def index(req, gender, ageBracket, healthStatus):
    gender = cgi.escape(gender)
    age_bracket = cgi.escape(ageBracket)
    health_bracket = cgi.escape(healthStatus)
    x = doSql()
    rets = x.execqry("select * from get_fitnessplan('" + gender + "', '" + ageBracket + "', '" + healthStatus + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
