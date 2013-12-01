
models = require '../../models'

# dbclient = require("mongodb").MongoClient


routes = (app, assets) ->

  app.get '/results', (req, res) ->  
    
    q = req.query.q
    unless q
      res.send null

    # dbclient.connect "mongodb://127.0.0.1:27017/test", (err, db) ->

    #   throw err  if err
    #   search = 
    #     text: 'users'
    #     search: q
      
    #   db.command search, (e, o) -> 
    #     db.close()
    #     if e 
    #         console.log e, 'error'    
    #     else 
    #       res.send 200

    models.create 'User', (err, User, conn) ->
      throw err if err

      User
        .textSearch q, (err, results) ->
          debugger
          conn.close()
          throw err if err

          console.log results

          res.send 200




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