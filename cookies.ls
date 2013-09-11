# For finding the root cause of 7-24 on Chrome 26

require! express

app = express!
app.use express.cookieParser!

app.get '/visit', (req, res) !->
	visit = parseInt req.cookies.visit or 0
	res.cookie 'visit', visit + 1
	res.send 'Visit #' + visit

app.get '/clear', (req, res) !->
	res.clearCookie 'visit'
	res.send 'Cookie cleared.'

app.listen 8001
