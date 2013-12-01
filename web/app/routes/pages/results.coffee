find = require '../lib/find'
By = require '../lib/criteria'

routes = (app, assets) ->

  app.get '/results', (req, res) ->  
    
    q = req.query.q
    unless q
      res.send null

    models.create 'User', (err, User, conn) ->
      throw err if err

      User.find


    # #todo: map keyword to criteria
    # criteria = []
    # criteria.push keyword

    # find.users By.categories(criteria), (err, users)->
      
    #   throw err if err

    #   res.render __dirname + '/views/results',
    #     title: 'Results'
    #     stylesheets: [assets.tag '/static/css/results.css']
    #     users: users



module.exports = routes