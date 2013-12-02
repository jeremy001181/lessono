models = require '../../models'
textSearch = require '../../lib/text-search'

routes = (app, config)->

  #
  # api - search
  #

  app.get '/api/search', (req, res) ->
    # Analyze type of search
    q = req.query.q

    unless q
      res.send null
      return

    textSearch q, 'lessons', (err, output) ->
      
      throw err if err

      lessons = output.results.map (val)->
        val.obj

      res.json lessons



    
    
module.exports = routes