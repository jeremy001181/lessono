Repository = require './repository'
User = require '../models/user'
config = require '../config'

find = {}

find.users = (criterias, callback) ->
	users = []
	# to add db config
	repository = new Repository config.dbConnectionURL, 'users', config.maxNumberOfSearchResults

	repository.find criterias, {}, (err, results)->
		users = JSON.stringify(results)
		callback null, users



module.exports = find