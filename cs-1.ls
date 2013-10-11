# Hello World of cluster-server
# npm install cluster-server

require! {
	express
	cs: 'cluster-server'
}

cs ->
	app = express!
	app.get '/', (req, res) !->
		res.send 'Hello World!'
	app
