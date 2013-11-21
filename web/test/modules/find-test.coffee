
assert = require 'assert'
find = require '../../modules/find'
_by = require '../../modules/criteria'

require '../../models/user'

describe 'find', ->
	users = null
	before () ->
		users = find.users _by.categories(["math"])
	it 'should return list of users', ->
		assert.notEqual users, undefined
