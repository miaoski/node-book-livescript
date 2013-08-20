# Example 2-10 Making the chat server more robust
# Example 2-11 Checking the write status of sockets
# Example 2-12 Logging errors

require! net

clientList = []
chatServer = net.createServer!

do
	client <-! chatServer.on \connection
	client.name = client.remoteAddress + \: + client.remotePort
	client.write "Hi!\n" + client.name + "!\n"
	clientList.push client

	client.on \data (data) !->
		broadcast data, client

	client.on \end !->
		clientList.splice clientList.indexOf(client), 1

	client.on \error (e) !->
		console.log e

broadcast = (msg, client) !->
	cleanup = []
	for i in clientList when i isnt client
		if i.writable
			i.write client.name + " says " + msg
		else
			cleanup.push i
			i.destroy!
	for i in cleanup
		clientList.splice clientList.indexOf(i), 1

chatServer.listen 9000
