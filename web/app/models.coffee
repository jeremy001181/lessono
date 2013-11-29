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
  model = conn.model name, schemas.tag
  callback null, model, conn


module.exports = models
