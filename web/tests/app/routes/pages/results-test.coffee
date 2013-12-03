require '../../../_helper'

express = require 'express'
assert  = require 'assert'
request = require 'request'
app     = require '../../../../app'
textSearch = require '../../../../app/lib/text-search'
sinon   = require 'sinon'

describe 'results', ->
  describe 'GET /results', ->
    describe 'with no query string', ->
      body = null
      res  = null
      mock = null

      before (done) ->

        mock = sinon.spy(textSearch);

        request {uri:'http://localhost:' + app.settings.port + '/results'}, (err, response, _body) ->
          body = _body
          res = response
          done()
      
      it 'should return no body when q is not provided', ()->
        assert.equal res.body, undefined
      it 'should have status code equal 200', ()->
        assert.equal res.statusCode, 200
      it 'should return without continue to do search', ()->
        assert.equal mock.called, false

    