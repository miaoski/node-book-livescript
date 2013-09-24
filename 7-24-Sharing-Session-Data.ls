# Example 7-24 Sharing session data between Express and Socket.IO
# Migrated to Express 3.x
# Prerequisite: npm install jade
#               npm install connect
#               npm install cookie
# Note: 
# 1. createServer should come after app.configure!
# 2. If you connect to 127.0.0.1, mind the connect() in views/socket.jade
#    Or, cookies won't be set.  Cf.  http://stackoverflow.com/questions/10359333/cant-get-express-session-id-from-cookies-w-socket-io
#    I have spend 3 hours by this XSS-prevention.
# 3. Don't use session.sid.  It doesn't work.
#    The default name is good: connect.sid
# 4. Remember decodeURIComponent
# 5. Workaround session.save(): this.id has no value
# 6. Fixed the "cannot get sessionID from coockie" issue of Chrome v26.

require! {
	http
	express
	connect
	cookie
	io: 'socket.io'
}

app = express!
store = new express.session.MemoryStore!
Session = connect.middleware.session.Session

app.use express.cookieParser!
app.use express.session {
	secret: 'secretKey'
	store: store
}

app.get '/', (req, res) !->
	sess = req.session
	console.log "SessionID in Express = " + req.sessionID
	# console.log "store = "
	# console.log store
	# console.log "sess.email = " + sess.email
	res.render 'socket.jade', {email: sess.email || 'noSessMail'}

server = http.createServer app
server.listen 8080

sio = io.listen server
sio.configure !->
	sio.set 'authorization', (handshake, accept) !->
		# console.log handshake.headers
		secretCookie = cookie.parse decodeURIComponent handshake.headers.cookie
		cookies = connect.utils.parseSignedCookies secretCookie, 'secretKey'
		handshake.sid = cookies['connect.sid']
		handshake.sessionStore = store
		store.get handshake.sid, (err, sess) !->
			if err || !sess
				return accept 'Invalid session', false
			else
				handshake.session = new Session handshake, sess
				accept null, true
	sio.sockets.on 'connection', (socket) !->
		sess = socket.handshake.session
		sid = socket.handshake.sid
		console.log "sid in Socket.IO = " + sid
		socket.join socket.handshake.sid
		socket.on 'emailupdate', !->
			sess.email = it.email
			store.set sid, sess
			# XXX: sess.save!
			sio.sockets.in socket.handshake.sid
				.emit 'emailchanged', { email: it.email }
			# console.log socket.handshake.sessionStore
