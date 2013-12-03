models = require '../../models'

routes = (app, config) ->

  #
  # api - suggest
  #

  app.get '/api/suggest', (req, res) ->
    # Analyze type of search
    q = req.query.q

    unless q
      res.send()
      return

    models.create 'Tag', (Tag, conn) ->
      
      Tag
        .find({'_id': new RegExp('^' + q + '.*', 'ig')})
        .limit(config.maxNumberOfAutocompleteItems)
        .exec (err, tags) ->
          conn.close()
          throw err  if err
          res.json tags.map (tag) ->
            return tag._id

module.exports = routes