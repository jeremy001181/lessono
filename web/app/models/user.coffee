
class User
	
	constructor: (attrs) ->
		@[key] = value for key, value of attrs
		@

module.exports = User