
require 'assert'
require '../../modules/repository'
require 'sinon'


describe 'repository', () ->

	before ()->

	it 'should call db.close', ->
		spy = sinon.spy
		mock = sinon.mock
	