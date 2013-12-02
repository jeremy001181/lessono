mongoose   = require 'mongoose'
# textSearch = require 'mongoose-text-search'

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
  _id: mongoose.Schema.ObjectId
  user_id: String,
  first_name: String,
  last_name: String,
  title: String,
  description: String,
  tags: [String],
  next_available_at: Array,
  reputation: Number

#
# User
#

schemas.User = mongoose.Schema
  _id: String
  first_name: String
  last_name: String
  lessons: [
    lesson_id: mongoose.Schema.ObjectId
  ]
  online: Boolean


# schemas.User.plugin textSearch

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