mongoose = require 'mongoose'
schemas  = require './schemas'


models = {}

# User

models.User = mongoose.model 'User', schemas.user

# Lesson

models.Lesson = mongoose.model 'User', schemas.lesson



module.exports = models
