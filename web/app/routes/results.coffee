find = require '../lib/find'
By = require '../lib/criteria'

routes = (app) ->

	app.get '/results', (req, res) ->  
		
		
		keyword = req.query.q
		return unless keyword
		console.log keyword
		#todo: map keyword to criteria
		criteria = []
		criteria.push keyword

		find.users By.categories(criteria), (err, users)->
			
			throw err if err

			res.render __dirname + '/views/results',
				title: 'Results'
				stylesheets: ['results']
				users: users



module.exports = routes