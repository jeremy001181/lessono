models = require '../../models'

routes = (app, assets) ->
  app.get '/lesson/:id', (req, res) ->

    sessionId = req.params.id  

    models.create 'Lesson', (Lesson, conn) ->

      Lesson.findOne {'_id': sessionId}, (err, lesson) ->
        conn.close()
        throw err if err
        res.json lesson

    #todo: validation
    # res.render __dirname + '/views/lesson',
    #   title: 'lesson'
    #   stylesheets: [assets.tag '/static/css/lesson.css']

module.exports = routes