express = require "express"
path = require "path"
jade = require "jade"
rateLimiter = require "connect-ratelimit"

app = express()

app.configure ->

  app.set "port", process.env.PORT or 8000

  app.use express.favicon()
  app.use express.bodyParser()
  app.use express.methodOverride()

  app.set "view engine", "jade"
  app.set "views", path.resolve(__dirname, "views")
  app.engine "jade", jade.__express

  app.use express.static(path.resolve(__dirname, "public"))

app.configure "production", ->

  app.use express.staticCache()
  app.use express.compress()
  app.use rateLimiter()

app.get "/", (req, res) ->

  res.render "index",
    pageName: "Luluwrite"

app.post "/create_post", (req, res) ->

  res.redirect "/#{newID}"

app.get "/:id", (req, res) ->

  id = req.params.id
  title = "Test title"
  body = "this is a test post let me just say"
  res.render "post",
    pageName: "#{title} on Luluwrite"
    title: title
    body: body

app.listen(app.get "port")
console.log "App started in #{app.get "env"} mode on port #{app.get 'port'}"
