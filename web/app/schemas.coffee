mongoose = require 'mongoose'

schemas = {}

schemas.user = mongoose.Schema
  username: String

# schemas.user.methods.whatIsMyName = ->
#   return @name

#
# Lesson
#

schemas.lesson = mongoose.Schema
  lesson_id: ObjectId
  title: String,
  description: String,
  tags: Array,
  next_available_at: Array,
  reputation: Number,



# ...



module.exports = schemas