mongoose = require 'mongoose'
schemas  = require './schemas'
config = require '../config'


models = {}


models.create = (name, callback)->  
  
  conn = mongoose.createConnection config.dbConnectionURL
  model = conn.model name, schemas[name]
  callback null, model, conn


module.exports = models
