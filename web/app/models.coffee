mongoose = require 'mongoose'
config = require '../config'


models = {}

models.create = (name, callback)->  
  
  conn = mongoose.createConnection config.dbConnectionURL
  schema = require "./schemas/#{name}"
  model = conn.model name, schema
  callback model, conn

module.exports = models
