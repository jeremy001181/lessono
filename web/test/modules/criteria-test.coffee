
assert   = require 'assert'
_criteria = require '../../modules/criteria'

describe 'criteria', ->

	# describe 'category', ->
	# 	before () ->
	# 		criteria = _criteria.categories ["math", "art"]
	# 	it 'should set criteria categories', ->
	# 		assert.notEqual criteria.category, undefined
	# 	it 'should set criteria categories', ->
	# 		assert.notEqual criteria.category, undefined

	describe 'name', ->
		criteria = null
		before () ->
			criteria = _criteria.name "ming"
		it 'should set regex expression', ->
			assert.equal criteria.fullname.$regex, "/\\bming/gi"
