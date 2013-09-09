# 7-22 Attaching Socket.IO to an Express application: server code
# Migrated to Express 3.x

require! {
	http
	express
	io: 'socket.io'
}

app = express!
server = http.createServer app
io = io.listen server

server.listen 8080

app.get '/', (_, res) !->
	res.sendfile __dirname + '/7-21-socket_express.html'

io.sockets.on 'connection', (socket) !->
	socket.emit 'news', {
		title: 'Welcome to World News'
		contents: 'This news flash was sent from node.js!'
		allowResponse: true
	}
	socket.on 'scoop', !->
		socket.emit 'news', {
			title: 'Circular Emissions Worked'
			contents: 'Received this content: ' + it.contents
		}
