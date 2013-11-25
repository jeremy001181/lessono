
assert   = require 'assert'
_criteria = require '../../app/lib/criteria'

describe 'criteria', ->

	describe 'category', ->
		criteria = null
		before () ->
			criteria = _criteria.categories ["math", "art"]
		it 'should set categories regex expression', ->
			assert.equal criteria.categories.$regex, "/(\\bmath|\\bart)/gi"

	describe 'name', ->
		criteria = null
		before () ->
			criteria = _criteria.name "ming"
		it 'should set name regex expression', ->
			assert.equal criteria.fullname.$regex, "/\\bming/gi"