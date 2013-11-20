criteria = {}

criteria.name = (keyword) ->
	criteria = fullname: 
		$regex: new RegExp "\\b" + keyword, "ig"

	return criteria

criteria.categories = (categories) ->
	criteria = name: 
		$regex: new RegExp "\\b" + keyword, "ig"

	return criteria

module.exports = criteria