describe 'Model: Domain', () ->
  domain = availability = null
  beforeEach module 'hipsterdomainsApp'

  beforeEach inject (_domain_,_availability_) ->
    Domain = _domain_
    availability = _availability_
    domain = new Domain 'test'

  it 'should have a name', ->
    expect(domain.name).toEqual 'test'

  it 'should have availability initally null', ->
    expect(domain.availability).toBe null
