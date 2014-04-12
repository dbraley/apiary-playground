express = require 'express'
bodyParser = require 'body-parser'
morgan = require 'morgan'

app = express()
app.use(bodyParser());

app.use(morgan())

app.use (req, res, next) ->
  res.contentType('application/json')
  next()

app.post '/machines', (req, res) ->
  console.log "BODY: " + JSON.stringify(req.body)
  res.send 202 , {'message': 'Accepted'}

app.get '/machines', (req, res)  ->
  res.send 200, [{            "_id": "52341870ed55224b15ff07ef",            "type": "bulldozer",            "name": "willy"        }]

app.get '/machines/:name', (req, res) ->
  console.log "NANE: " + req.params.name
  res.send 200, {            "_id": "52341870ed55224b15ff07ef",            "type": "bulldozer",            "name": "willy"        }

app.delete '/machines/:name', (req, res) ->
  res.send 204

app.listen 3000
console.log('Listening on port 3000');
