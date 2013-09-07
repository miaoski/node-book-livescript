# Example 2-16 A test for the POST API
# Note that expected data differs.
# Even if you write 2-15 in JavaScript, the result differs from the book.

require! http
require! assert

opts =
	host: 'localhost'
	port: 8000
	path: '/send'
	method: \POST
	headers:
		'content-type': 'application/x-www-form-urlencoded'

req = http.request opts, (res) ->
	res.setEncoding('utf8')
	data = ''
	res.on 'data', !-> data += it
	res.on 'end',  !-> assert.strictEqual data,
		'{\n  "status": "ok",\n  "message": "Tweet received"\n}'

req.write 'tweet=test'
req.end!
