dbclient = require("mongodb").MongoClient

class Repository  
  constructor: (connectionURL, collection, total) ->
    @connectionURL= connectionURL
    @total= total
    @collection= collection
  # expecting queries in format of: {field : {$regex : /pattern/}}
  # expecting fields in format of: {"field1","field2" ...}
  find: (queries, fields, callback) ->
    self = @

    dbclient.connect self.connectionURL, (err, db) ->  
          
      throw err if err
      collection = db.collection(self.collection)

      projections = {}
      for field in fields
        projections[field] = 1

      collection.find(queries, projections)
        .limit(self.total)
        .toArray (err, results) ->
          db.close()
          callback null, results

  textSearch: (q, project, callback) ->
    self = @

    dbclient.connect self.connectionURL, (err, db) ->  
          
      throw err if err
      if err 
        callback err, null
        return

      search = 
        text: self.collection
        search: q
        project
      
      db.command search, (err, o) ->
        db.close()
        callback err, o

module.exports = Repository