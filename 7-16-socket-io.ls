# 7-16 Creating a Socket.IO server

require! http
require! io: 'socket.io'

server = http.createServer!
server.on 'request', (req, res) !->
	res.writeHead 200, {'Content-Type': 'text/plain'}
	res.end 'Hello World'
server.listen 8080

socket = io.listen server
socket.on 'connection', !->
	console.log 'Client connected.'
