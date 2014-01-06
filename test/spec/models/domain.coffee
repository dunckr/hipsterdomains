describe 'Model: Domain', () ->
  domain = availability = null
  beforeEach module 'hipsterdomainsApp'

  beforeEach inject (_domain_,_availability_,_$q_) ->
    $q = _$q_
    deferred = $q.defer()
    Domain = _domain_
    availability = _availability_
    spyOn(availability,'check').andReturn deferred.promise
    deferred.resolve true
    domain = new Domain 'test'

  it 'should have a name', ->
    expect(domain.name).toEqual 'test'

  it 'should have availability initally null', ->
    expect(domain.availability).toBe null

  it 'should lookup availability on check', ->
    domain.check()
    expect(availability.check).toHaveBeenCalled()
