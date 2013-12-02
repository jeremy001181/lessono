mongoose   = require 'mongoose'
textSearch = require 'mongoose-text-search'

schemas = {}

#
# Tag
#

schemas.Tag = mongoose.Schema
  _id: String

#
# Lesson
#

schemas.Lesson = mongoose.Schema
  lesson_id: mongoose.Schema.ObjectId
  title: String,
  description: String,
  tags: [String],
  next_available_at: Array,
  reputation: Number

#
# User
#

schemas.Users = mongoose.Schema
  _id: String
  first_name: String
  last_name: String
  lessons: [schemas.lesson]
  online: Boolean


schemas.Users.plugin textSearch

# schemas.User.index 
#   'first_name':'text'
#   'last_name':'text'  
  # 'lessons.title':'text'
  # 'lessons.description':'text'
  # 'lessons.tags':'text'

# schemas.User.methods.whatIsMyName = ->
#   return @name


# ...



module.exports = schemas