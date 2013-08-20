# Example 2-5 Communicating between clients

require! net

clientList = []
chatServer = net.createServer!

do
	client <- chatServer.on \connection
	client.write "Hi!\n"
	clientList.push client
	data <- client.on \data
	for i in clientList then i.write data

.listen 9000
