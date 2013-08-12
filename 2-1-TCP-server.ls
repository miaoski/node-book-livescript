# Example 2-1 Createing a new TCP server

require! net

chatServer = net.createServer!

.on \connection (client) ->
		client.write \Hi\n
		client.write \Bye\n
		client.end!

.listen 9000
