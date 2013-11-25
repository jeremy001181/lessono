
assert = require 'assert'
config = require '../config'

hasBeenSet = (data) ->
  return (if data then true else false)

describe 'config', () ->
  it 'should set max number of autocomplete items', ->
    assert.equal hasBeenSet(config.maxNumberOfAutocompleteItems), true
  it 'should set db connection URL', ->
    assert.equal hasBeenSet(config.dbConnectionURL), true
  it 'should set max number of search results', ->  
    assert.equal hasBeenSet(config.maxNumberOfSearchResults), true

