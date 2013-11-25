var rack = require('asset-rack');
var search   = require('./public/js/controls/search.js');

assets = new rack.AssetRack([  
  new rack.BrowserifyAsset({
    url: '/app.js',
    filename: __dirname + '/public/js/controls/search.js',
    gzip: true,
    compress: true
  }),
  new rack.StaticAssets({
    urlPrefix: '/static',
    dirname: __dirname + '/public/css/',
    compress: true
  }),
  new rack.JadeAsset({
    url: '/index.htm',
    dirname: __dirname + '/app/routes/home/views/'
  })
]);

assets.on('complete', function() {
    
  /**
   * Module dependencies.
   */
  require('coffee-script');

  var express = require('express');
  var http = require('http');
  var path = require('path');
  var app = express();

  // asset rack

  // rack = require 'asset-rack'

  // var asset = new rack.JadeAsset({
  //  url: '/templates.js',
  //     dirname: './templates'
  // });

  // all environments

  app.set('port', process.env.PORT || 3000);
  app.set('views', path.join(__dirname, 'views'));
  app.set('view engine', 'jade');


  app.use(assets);
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

  require('./app/routes/results/routes')(app);
  require('./app/routes/home/routes')(app);

  app.get('*', function(req, res){
    res.send('Say what???', 404);
  });

  http.createServer(app).listen(app.get('port'), function(){
    console.log('Express server listening on port ' + app.get('port'));
  });

});