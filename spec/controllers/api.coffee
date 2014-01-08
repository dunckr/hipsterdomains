expect = require 'expect.js'
request = require 'supertest'
app = require process.cwd() + '/server.js'

describe 'GET /api/:id', ->

  it 'should respond with json', (done) ->
    request(app)
      .get('/api/name')
      .set('Accept', 'application/json')
      .expect(200)
      .end (err,res) ->
        return done err if err
        done()

  it 'should return true if available', (done) ->
    request(app)
      .get('/api/unlikely12213123')
      .set('Accept', 'application/json')
      .expect(200)
      .end (err,res) ->
        return done err if err
        expect(res.body.availability).to.be.ok()
        done()

  it 'should return false if unavailable', (done) ->
    request(app)
      .get('/api/google')
      .set('Accept', 'application/json')
      .expect(200)
      .end (err,res) ->
        return done err if err
        expect(res.body.availability).to.not.be.ok()
        done()

  it 'should only accept text and numbers', (done) ->
    request(app)
      .get('/api/te.st')
      .set('Accept', 'application/json')
      .expect(200)
      .end (err,res) ->
        return done err if err
        expect(res.body.availability).to.not.be.ok()
        done()
