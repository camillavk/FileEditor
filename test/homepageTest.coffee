server = require '../server.coffee'
chai = require 'chai'
expect = chai.expect
Browser = require 'zombie'
fs = require 'fs'


describe 'Homepage', ->
	#browser = null

	before ->
	server = server.listen(3000)
	browser = new Browser({ site: 'http://localhost:3000' })
	fs.writeFile('code/_test.txt', 'Lorem ipsum')

	after ->
		fs.unlink('code/_test.txt')

	it 'should have a welcome message', (done) ->
		browser.visit '/', ->
			expect(browser.text('h1')).to.equal("Welcome to FileEditor")
			done()

