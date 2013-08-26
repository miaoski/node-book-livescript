# Example 2-3 Listening to each connection

require! net

chatServer = net.createServer!

.on \connection (client) ->
		client.write \Hi\n
		client.on \data (data) ->
			console.log data

.listen 9000
