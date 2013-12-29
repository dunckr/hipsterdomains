describe 'Model: Domain', () ->
  domain = null
  beforeEach module 'hipsterdomainsApp'

  beforeEach inject (_domain_) ->
    Domain = _domain_
    domain = new Domain()

  it 'should be defined', ->
    expect(domain).toBeDefined()
