dbclient = require("mongodb").MongoClient

class Repository  
  constructor: (connectionURL, collection, total) ->
    @connectionURL= connectionURL
    @total= total
    @collection= collection
  # expecting queries in format of: {field : {$regex : /pattern/}}
  # expecting fields in format of: {"field1","field2" ...}
  find: (queries, fields, callback) ->
    that = @

    dbclient.connect that.connectionURL, (err, db) ->  
          
      throw err if err
      collection = db.collection(that.collection)

      projections = {}
      for field in fields
        projections[field] = 1

      collection.find(queries, projections)
        .limit(that.total)
        .toArray (err, results) ->
          db.close()
          callback null, results


module.exports = Repository