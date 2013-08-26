# Example 2-15 Adding a basic API

require! express

app = express!
app.listen 8000

tweets = []

app.get '/', (req, res) !->
	res.send 'Welcome to Node Twitter'

app.post '/send', express.bodyParser!, (req, res) !->
	if req.body and req.body.tweet
		tweets.push req.body.tweet
		res.send {
			status: 'ok'
			message: 'Tweet received' }
	else
		res.send {
			status: \nok
			message: 'No tweet received' }

app.get '/tweets', (req, res) !->
	res.send(tweets)
