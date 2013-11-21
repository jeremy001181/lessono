dbclient = require("mongodb").MongoClient


class Repository
	
	constructor: (connectionURL, collection, total) ->
		@connectionURL= connectionURL
		@total= total
		@collection= collection

	# expecting queries in format of: {field : {$regex : /pattern/}}
	# expecting fields in format of: {"field1","field2" ...}
	find: (queries, fields, callback) ->

		dbclient.connect @connectionURL, (err, db) ->			
			throw err  if err
			collection = db.collection(@collection)

			projections = {}			
			for field in fields
				projections[field] = 1

			collection.find(queries, projections)
				.limit(@total)
				.toArray (err, results) ->
					db.close()
					callback null, results


module.exports = Repository



# search = {}

# search.find = (queries, fields) ->

# 	#config = app.settings;
	
# 	#encodedTerm = encodeURIComponent req.query.term.toLowerCase()

# 	#return  unless encodedTerm


# 	dbclient.connect config.dbConnectionURL, (err, db) ->
		
# 		throw err  if err
		
# 		collection = db.collection(query.collection)
# 		# Locate all the entries using find

# 		collection.find(
# 			name: 
# 				$regex: new RegExp("\\b" + encodedTerm, "ig"),
# 			_id: 0
# 			name: 1).limit(config.maxNumberOfAutocompleteItems).toArray (err, results) ->
# 				# Let's close the db
# 				db.close()
# 				res.send results.map((val) ->
# 					val.name)


# module.exports = search