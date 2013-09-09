# Example 7-24 Sharing session data between Express and Socket.IO
# Migrated to Express 3.x
# Prerequisite: npm install jade
#               npm install connect
#               npm install cookie

require! {
	http
	express
	connect
	cookie
	io: 'socket.io'
}

app = express!
store = new express.session.MemoryStore
utils = connect.utils
Session = connect.middleware.session.Session
server = http.createServer app

app.configure !->
	app.use express.cookieParser!
	app.use express.session {secret: 'secretKey', key: 'express.sid', store: store}
	app.use (req, res) !->
		sess = req.session
		sess.cookie.expires = false
		res.render 'socket.jade', { email: sess.email || '' }

server.listen 8080
sio = io.listen server

sio.configure !->
	sio.set 'authorization', (data, accept) !->
		cookies = cookie.parse data.headers.cookie
		data.sessionID = cookies['express.sid']
		data.sessionStore = store
		store.get data.sessionID, (err, session) !->
			if err || ! session
				return accept 'Invalid session', false
			else
				data.session = new Session data, session
				return accept null, true
	sio.sockets.on 'connection', (socket) !->
		session = socket.handshake.session
		socket.join socket.handshake.sessionId
		socket.on 'emailupdate', !->
			session.email = it.email
			session.save!
			sio.sockets.in socket.handshake.sessionID
				.emit 'emailchanged', { email: it.email }
