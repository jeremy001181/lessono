
routes = (app) ->
	app.get '/', (req, res) ->


		# res.send __dirname
		res.render __dirname + '/views/index',
			title: 'home'
			stylesheet: 'home'

module.exports = routes