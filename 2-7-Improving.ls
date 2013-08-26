# Example 2-7 Improving the sending of messages

require! net

clientList = []
chatServer = net.createServer!

do
	client <-! chatServer.on \connection
	client.name = client.remoteAddress + \: + client.remotePort
	client.write "Hi!\n" + client.name + "!\n"
	clientList.push client

	data <-! client.on \data
	broadcast data, client

broadcast = (msg, client) !->
	for i in clientList when i isnt client
		i.write client.name + " says " + msg

chatServer.listen 9000
