models = require '../../models'

routes = (app, assets) ->

  app.get '/register', (req, res) ->

    res.render "#{__dirname}/views/register",
      title: 'Register'
      stylesheets: [assets.tag '/static/css/register.css']


  app.post '/register', (req, res) ->
    
    username  = req.body.username
    hashedPassword  = req.body.password
    firstName = req.body.firstName
    lastName  = req.body.lastName

    models.create 'User', (User, conn)  ->

      data = 
        first_name: firstName
        last_name: lastName
        password: hashedPassword
        _id: username

      User.create data, (err, user) ->
        conn.close()
        throw err if err
        res.redirect "/account/#{user._id}" 



module.exports = routes