
assert = require 'assert'
find = require '../../app/lib/find'
_by = require '../../app/lib/criteria'

require '../../app/models/user'

describe 'find', ->
  users = null
  before () ->
    users = find.users _by.categories(["math"])
  it 'should return list of users', ->
    assert.notEqual users, undefined
