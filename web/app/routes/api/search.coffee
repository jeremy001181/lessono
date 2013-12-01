models = require '../../models'

routes = (app, config)->

  #
  # api - search
  #

  app.get '/api/search', (req, res) ->
    # Analyze type of search
    q = req.query.q

    throw unless q



    
    
module.exports = routes