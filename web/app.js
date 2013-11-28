/**
 * Module dependencies.
 */

require('coffee-script');

var express = require('express');
var http = require('http');
var path = require('path');
var app = express();
var rack = require('./assets');

// all environments

app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');


app.use(rack);
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.static(path.join(__dirname, 'public'), { maxAge: 86400000 }));
app.use(app.router);

// production

if (app.configure("production", function () {
  app.set('port', 80);
}));

// test only

if (app.configure("test", function () {
  app.set('port', 3001);
}));

// development only

if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

// routes

require('./app/routes/results')(app, rack);
require('./app/routes/home')(app, rack);

app.get('*', function(req, res){
  res.send('Say what???', 404);
});


rack.on('complete', function() {
    
  http.createServer(app).listen(app.get('port'), function(){
    console.log('Express server listening on port ' + app.get('port'));
  });

});