mongoose   = require 'mongoose'

user = mongoose.Schema
  _id: String
  first_name: String
  last_name: String
  password: String
  lessons: [
    lesson_id: mongoose.Schema.ObjectId
  ]
  online: Boolean

user.path('_id').validate ((val) -> 
  #todo: check if it's valid user name
  return /./ig.test val
  ), 'Invalid username'

user.set 'versionKey', false

module.exports = user