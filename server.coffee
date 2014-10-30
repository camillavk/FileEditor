express = require 'express'
app = express()
ide = require('http').Server(app)
fs = require 'fs'
io = require('socket.io')(ide)

#app.use(require('express').static('public'))
#app.use express.static '#{__dirname}/static'

app.set 'view engine', 'ejs'

app.get '/', (request, response) ->
	response.render "index",

module.exports = ide