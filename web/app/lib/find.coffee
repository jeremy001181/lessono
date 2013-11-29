Repository = require './repository'
User = require '../models/user'
config = require '../../config'

find = {}

find.users = (criterias, callback) ->
  users = []
  # to add db config
  repository = new Repository config.dbConnectionURL, 'users', config.maxNumberOfSearchResults

  repository.find criterias, ["firstName","lastName"], (err, results)->
    users = results.map (val) ->
      return new User val
    
    callback null, users






module.exports = find