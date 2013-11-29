
assert     = require 'assert'
Repository = require '../../app/lib/repository'
sinon      = require 'sinon'


describe 'repository', () ->
  repository = null
  before ()->
    repository = new Repository 'http://localhost','user',10

  describe 'create', () ->
    
    it 'should set collection', ->
      assert.equal repository.collection, 'user'
    it 'should set db connection url', ->
      assert.equal repository.connectionURL, 'http://localhost'
    it 'should set total', ->
      assert.equal repository.total, 10

  describe 'find', ->

    sinon.spy repository, collection

    before () ->
      repository.find
