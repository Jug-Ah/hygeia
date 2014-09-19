from dosql import *
import cgi
import web 
import sha
import simplejson as json


web.config.debug = False

urls = (
  '/login', 'Login',
  '/reset', 'Reset',
)
app = web.application(urls, locals())
db = web.database(dbn='postgres', db='hygeia', user='postgres', pw='ihopeyourehappy')

store = web.session.DiskStore('sessions')
session = web.session.Session(app, store,
                              initializer={'login': 0, 'privilege': 0})
							  
def logged():
    if session.login==1:
        return True
    else:
        return False
		
def create_render(privilege):
    if logged():
        if privilege == 0:
            render = web.template.render('templates/reader')
        elif privilege == 1:
            render = web.template.render('templates/user')
        elif privilege == 2:
            render = web.template.render('templates/admin')
        else:
            render = web.template.render('templates/communs')
    else:
        render = web.template.render('templates/communs')
    return render
	
class Login:

    def GET(self):
        if logged():
            render = create_render(session.privilege)
            return '%s' % render.login_double()
        else:
            render = create_render(session.privilege)
            return '%s' % render.login()
			
    def POST(self):
        s = sha.new()
        name, passwd = web.input().name, web.input().passwd
        ident = db.select('example_users', where='name=$name', vars=locals())[0]
        try:
            if s.sha1("sAlT754-"+passwd).hexdigest() == ident['pass']:
                session.login = 1
                session.privilege = ident['privilege']
                render = create_render(session.privilege)
                return render.login_ok()
            else:
                session.login = 0
                session.privilege = 0
                render = create_render(session.privilege)
                return render.login_error()
        except:
            session.login = 0
            session.privilege = 0
            render = create_render(session.privilege)
            return render.login_error()
		
		
class Reset:

    def GET(self):
        session.login = 0
        session.kill()
        render = create_render(session.privilege)
        return render.logout()