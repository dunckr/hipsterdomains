expect = require 'expect.js'
request = require 'supertest'
app = require process.cwd() + '/server.js'

describe 'GET /api/:id', ->

  it 'respond with json', (done) ->
    request(app)
      .get('/api/name')
      .set('Accept', 'application/json')
      .expect(200)
      .end (err,res) ->
        return done err if err
        done()
