rack = require 'asset-rack'

assets = [
  new rack.BrowserifyAsset(
    url: "/static/js/home.js"
    filename: __dirname + "/public/js/home.js"
    gzip: true), 
  new rack.BrowserifyAsset(
    url: "/static/js/results.js"
    filename: __dirname + "/public/js/results.js"
    gzip: true), 
  new rack.BrowserifyAsset(
    url: "/static/js/register.js"
    filename: __dirname + "/public/js/register.js"
    gzip: true), 
  # new rack.StaticAssets(
  #   urlPrefix: "/static/css"
  #   dirname: __dirname + "/public/css/"
  #   compress: true)

  new rack.LessAsset(
    url: '/static/css/home.css'
    filename: __dirname + "/public/css/home.less"
  ),
  new rack.LessAsset(
    url: '/static/css/register.css'
    filename: __dirname + "/public/css/register.less"
  ),
  new rack.LessAsset(
    url: '/static/css/results.css'
    filename: __dirname + "/public/css/results.less"
  )
]

module.exports = new rack.AssetRack(assets)
