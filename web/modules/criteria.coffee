criteria = {}

criteria.name = (keyword) ->
	criteria = fullname: 
		$regex: new RegExp "\\b" + keyword, "ig"

	return criteria

criteria.categories = (categories) ->
	pattern = "(\\b" + (categories.join "|\\b") + ")"

	criteria = categories: 
		$regex: new RegExp pattern, "ig"

	return criteria

module.exports = criteria