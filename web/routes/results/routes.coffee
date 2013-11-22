
find = require '../moduels/find'
By = require '../moduels/criteria'

routes = (app) ->

	app.get '/results', (req, res) ->  
	

		keyword = req.query.term
		return unless keyword

		#todo: map keyword to criteria

		find.users By.categories(criteria), (err, users)->
			res.render '#{__dirname}/views/results',
				title: 'Results'
				stylesheet: 'results'
				users: users


			# res.send users.map (user) -> 
			# 	user.name

module.exports = routes