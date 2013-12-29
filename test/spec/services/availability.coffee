describe 'Service: Availability', ->
  availability = $http = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject (_Availability_,_$http_,_$q_) ->
    $q = _$q_
    $http = _$http_
    Availability = _Availability_
    availability = new Availability $http, $q

  it 'should be defined', ->
    expect(availability).toBeDefined()

  it 'should return true if domain is available', ->
    expect(availability.check('123123asdasdz')).toBe true

  it 'should return false if domain isn\'t available', ->
    expect(availability.check('test')).toBe false


  # it 'should get data', ->
  #   data = '123'
  #   spyOn(domains, '_domains').andReturn data
  #   expect(domains.get('')).toEqual data
