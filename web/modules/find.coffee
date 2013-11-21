Repository = require './repository'
User = require '../models/user'

find = {}

find.users = (criterias) ->
	users = []
	# to add db config
	repository = new Repository 

	repository.find queries, projection, (err, results)->

		users = JSON.stringify(results)
		return users

module.exports = find