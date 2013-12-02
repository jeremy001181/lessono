class Lesson extends Repository
  constructor: ->
    super("Parrot")

  dead: ->
    not @alive()