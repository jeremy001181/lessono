models = require '../../models'

routes = (app, config)->

  #
  # api - search
  #

  app.get '/api/search', (req, res) ->
    # Analyze type of search
    keyword = req.query.q

    
    
module.exports = routes