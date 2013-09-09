# Example 7-20 A namespace-enabled Socket.IO server

require! {
	http
	io: 'socket.io'
	fs
}

sockFile = fs.readFileSync '7-19-namespaces.html'

server = http.createServer!
server.on 'request', (req, res) !->
	res.writeHead 200, {'Content-Type': 'text/html'}
	res.end sockFile
server.listen 8080

socket = io.listen server

socket.of '/upandrunning'
	.on 'connection', !->
		console.log 'Client connected to Up and Running namespace.'
		it.send 'Welcome to "Up and Running"'

socket.of '/weather'
	.on 'connection', !->
		console.log 'Client connected to Weather namespace.'
		it.send 'Welcome to "Weather Updates"'
