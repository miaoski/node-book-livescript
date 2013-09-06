# Example 2-10 Making the chat server more robust
# Example 2-11 Checking the write status of sockets
# Example 2-12 Logging errors

# Use list comprehension instead of list.splice().
# However, this doesn't seem to be any prettier, because ~> and @ confuse the readers.

require! net

chatServer = net.createServer!
clientList = []

do
	client <~ chatServer.on \connection
	client.name = client.remoteAddress + \: + client.remotePort
	client.write "Hi!\n" + client.name + "!\n"
	clientList.push client

	client.on \data (data) !->
		broadcast data, client

	client.on \end !~>
		clientList := [i for i in clientList when i isnt client]

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
	clientList := [i for i in clientList when i not in cleanup]

chatServer.listen 9000
