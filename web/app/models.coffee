mongoose = require 'mongoose'
schemas  = require './schemas'
config = require '../config'


models = {}

# User

# models.User = mongoose.model 'User', schemas.user

# Lesson

#models.Tag = mongoose.model 'Tag', schemas.tag


models.create = (name, callback)->  
  
  conn = mongoose.createConnection config.dbConnectionURL
  model = conn.model name, schemas[name]

  # model.textSearch = (query, callback) -> 
  #   debugger
  #   dbclient.connect "mongodb://127.0.0.1:27017/test", (err, db) ->

  #     debugger
  #     throw err  if err
  #     search = 
  #       text: 'users'
  #       search: query
      
  #     db.command search, (e, o) -> 
  #       debugger
  #       if e 
  #           console.log e, 'error'    
  #       else 
  #         callback(e, o.results)  

  callback null, model, conn


module.exports = models
