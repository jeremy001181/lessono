mongoose = require 'mongoose'

schemas = {}

#
# Tag
#

schemas.tag = mongoose.Schema
  _id: String

#
# Lesson
#

schemas.lesson = mongoose.Schema
  lesson_id: mongoose.Schema.ObjectId
  title: String,
  description: String,
  tags: [String],
  next_available_at: Array,
  reputation: Number

#
# User
#

schemas.user = mongoose.Schema
  _id: String
  first_name: String
  last_name: String
  lessons: [schemas.lesson]
  online: Boolean

# schemas.user.methods.whatIsMyName = ->
#   return @name


# ...



module.exports = schemas