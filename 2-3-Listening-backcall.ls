# Example 2-3 Listening to each connection
# Use backcall

require! net

chatServer = net.createServer!

do
	client <- chatServer.on \connection
	client.write \Hi\n
	data <- client.on \data
	console.log data

.listen 9000
console.log 'Chat server started'
