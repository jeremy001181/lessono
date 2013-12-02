dbclient = require('mongodb').MongoClient


textSearch = (q, collection, callback) ->
  
    dbclient.connect 'mongodb://127.0.0.1:27017/test', (err, db) ->
      if err 
        callback err, null
        return

      search = 
        text: collection
        search: q
        project: 
          "first_name": 1
          "last_name": 1
          "_id": 1
      
      db.command search, (err, o) ->
        db.close()
        callback err, o

module.exports = textSearch