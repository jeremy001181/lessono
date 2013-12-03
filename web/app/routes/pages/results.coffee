
models = require '../../models'
textSearch = require '../../lib/text-search'

routes = (app, assets) ->

  app.get '/results', (req, res) ->  
    
    q = req.query.q
    unless q
      res.send null
      return

    textSearch q, 'lessons', (err, output) ->
      throw err if err

      lessons = output.results.map (val)->
        val.obj

      res.render __dirname + '/views/results', 
        title: 'results'
        stylesheets: [assets.tag '/static/css/results.css']
        lessons: lessons

    # models.create 'Users', (err, User, conn) ->
    #   throw err if err

    #   User
    #     .textSearch q, (err, results) ->
    #       debugger
    #       conn.close()
    #       throw err if err

    #       console.log results

    #       res.send 200




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