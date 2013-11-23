find = require '../../modules/find'
By = require '../../modules/criteria'

routes = (app) ->

	app.get '/results', (req, res) ->  
		
		
		keyword = req.query.q
		return unless keyword

		#todo: map keyword to criteria
		criteria = []
		criteria.push keyword

		find.users By.categories(criteria), (err, users)->
			
			throw err if err

			res.render __dirname + '/views/results',
				title: 'Results'
				stylesheet: 'results'
				users: users



module.exports = routes