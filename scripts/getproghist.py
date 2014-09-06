from dosql import *
import cgi
try:
    import json
except ImportError:
    import simplejson as json

def index(req, id):
    id = cgi.escape(id)
    x = doSql()
    rets = x.execqry("select * from getproghist('" + id + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
