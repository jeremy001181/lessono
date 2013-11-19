dbclient = require("mongodb").MongoClient
format = require("util").format

autocomplete = (app) ->
  app.get '/autocomplete', (req, res) ->  

    config = app.settings;
    
    encodedTerm = encodeURIComponent(req.query.term.toLowerCase())
    return  unless encodedTerm
    dbclient.connect config.dbConnectionURL, (err, db) ->
      throw err  if err
      collection = db.collection("users")
      
      # Locate all the entries using find
      collection.find(
        name:
          $regex: new RegExp("\\b" + encodedTerm, "ig")
      ,
        _id: 0
        name: 1
      ).limit(config.maxNumberOfAutocompleteItems).toArray (err, results) ->
        
        # Let's close the db
        db.close()
        res.send results.map((val) ->
          val.name
        )

module.exports = autocomplete