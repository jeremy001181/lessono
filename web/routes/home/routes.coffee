
routes = (app) ->
	app.get '/', (req, res) ->

		res.render __dirname + '/views/index',
			title: 'home'
			stylesheets: ['search']

module.exports = routes