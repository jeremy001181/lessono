mongoose   = require 'mongoose'

lesson = mongoose.Schema
  _id: mongoose.Schema.ObjectId
  user_id: String,
  first_name: String,
  last_name: String,
  title: String,
  description: String,
  tags: [String],
  next_available_at: Array,
  reputation: Number

lesson.set 'versionKey', false

module.exports = lesson