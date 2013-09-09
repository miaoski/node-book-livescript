# 7-18 Simple socket.io server
# Should be client.id, not client.sessionId

require! {
	http
	io: 'socket.io'
	fs
}

sockFile = fs.readFileSync '7-17-socket.html'

server = http.createServer!
server.on 'request', (req, res) !->
	res.writeHead 200, {'Content-Type': 'text/html'}
	res.end sockFile
server.listen 8080

socket = io.listen server
socket.on 'connection', !->
	console.log 'Client connected.'
	it.send 'Welcome client ' + it.id
