
routes = (app, assets) ->
  app.get '/', (req, res) ->

    res.render "#{__dirname}/views/index",
      title: 'home'
      stylesheets: [assets.tag '/static/css/home.css']

module.exports = routes