mongoose   = require 'mongoose'

tag = mongoose.Schema
  _id: String

tag.set 'versionKey', false

module.exports = tag
