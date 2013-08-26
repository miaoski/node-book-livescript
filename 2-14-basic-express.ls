# Example 2-14 A basic web server with Express

require! express

app = express!

.get '/', (req, res) !->
	res.send 'Welcome to Node Twitter'

.listen 8000
