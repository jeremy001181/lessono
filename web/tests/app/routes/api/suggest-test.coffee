require '../../../_helper'

express = require 'express'
assert  = require 'assert'
request = require 'request'
app     = require '../../../../app'
models = require '../../../../app/models'
sinon   = require 'sinon'

describe 'suggest', ->
  describe 'GET /api/suggest', ->
    describe 'with no query string', ->
      body = null
      res  = null
      createMethod = null

      before (done) ->

        createMethod = sinon.spy(models, 'create');

        request {uri:'http://localhost:' + app.settings.port + '/api/suggest'}, (err, response, _body) ->
          body = _body
          res = response
          done()
      
      it 'should return no body when q is not provided', ()->
        assert.equal res.body, undefined
      it 'should have status code equal 200', ()->
        assert.equal res.statusCode, 200
      it 'should return without continue to create model', ()->
        assert.equal createMethod.callCount, 0

    


# describe 'suggest', () ->
#   suggest = null
#   before ()->
#     app = 
#       get: (null, ) ->

#     suggest = require('../../../../../app/routes/api/suggest') 

# app = 
#   get: () ->

#   it 'should(thrown error when query string is undefined', ()->) 
#     assert.throws ()->

