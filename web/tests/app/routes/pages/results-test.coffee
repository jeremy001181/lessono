require '../../../_helper'

express = require 'express'
assert  = require 'assert'
request = require 'request'
app     = require '../../../../app'
models = require '../../../../app/models'
sinon   = require 'sinon'

describe 'results', ->
  describe 'GET /results', ->
    describe 'with no query string', ->
      body = null
      res  = null

      before (done) ->

        sinon.spy(models, 'create');

        request {uri:'http://localhost:' + app.settings.port + '/results?q=json'}, (err, response, _body) ->
          body = _body
          res = response
          done()
      
      after () ->
        models.create.restore()

      it 'should return no body when q is not provided', ()->
        assert.equal res.body, undefined
      it 'should have status code equal 200', ()->
        assert.equal res.statusCode, 200
      it 'should return without continue to create model', ()->
        assert.equal models.create.callCount, 0

    