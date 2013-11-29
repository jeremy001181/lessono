
assert = require 'assert'
User   = require '../../app/models/user'

describe 'User', ->


	describe 'create', ->
		user = null
		before () ->
			user = new User { firstName: 'ming', lastName: 'chen' }
		it 'sets first name', ->
			assert.equal user.firstName, 'ming'
		it 'sets last name', ->
			assert.equal user.lastName, 'chen'