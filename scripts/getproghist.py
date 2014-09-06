<<<<<<< HEAD
from dosql import *
import cgi
try:
    import json
except ImportError:
    import simplejson as json
=======
from dosql_g import *
import cgi
import simplejson as json

>>>>>>> 15afc79a86b6634998fefb6b4e4d858c813b9775

def index(req, id):
    id = cgi.escape(id)
    x = doSql()
    rets = x.execqry("select * from getproghist('" + id + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
