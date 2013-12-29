describe 'Service: Availability', ->
  availability = $httpBackend = $rootScope = deferred = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject (_Availability_,_$httpBackend_,_$q_,_$rootScope_) ->
    $rootScope = _$rootScope_
    $q = _$q_
    deferred = $q.defer()
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/api/test').respond deferred.promise
    Availability = _Availability_
    availability = new Availability $httpBackend, $q

  it 'should be defined', ->
    expect(availability).toBeDefined()

  it 'should return true if domain is available', ->
    result = null
    deferred.resolve true
    availability.check('test').then (data) ->
      result = data
    $httpBackend.flush()

    # result.then (data) ->
    #   console.log data
    $rootScope.$apply()
    expect(result).toBe true

  xit 'should return false if domain isn\'t available', ->
    # $httpBackend.flush()

    expect(availability.check('test')).toBe false


  # it 'should get data', ->
  #   data = '123'
  #   spyOn(domains, '_domains').andReturn data
  #   expect(domains.get('')).toEqual data
