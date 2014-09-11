from dosql_a import *
import cgi
import simplejson as json


def index(req, userId):
    userId = cgi.escape(userId)
	
    x = doSql()
    rets = x.execqry("select get_personalfitnessplan('" + userId + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
	
