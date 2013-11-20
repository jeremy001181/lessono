dbclient = require("mongodb").MongoClient

search = {}

search.find = (query) ->

	#config = app.settings;
	
	#encodedTerm = encodeURIComponent req.query.term.toLowerCase()

	#return  unless encodedTerm


	dbclient.connect config.dbConnectionURL, (err, db) ->
		
		throw err  if err
		
		collection = db.collection(query.collection)
		# Locate all the entries using find

		collection.find(
			name: 
				$regex: new RegExp("\\b" + encodedTerm, "ig"),
			_id: 0
			name: 1).limit(config.maxNumberOfAutocompleteItems).toArray (err, results) ->
				# Let's close the db
				db.close()
				res.send results.map((val) ->
					val.name)


module.exports = search