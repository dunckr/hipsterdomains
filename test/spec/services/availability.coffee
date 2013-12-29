describe 'Service: Availability', ->
  availability = $httpBackend = $rootScope = deferred = result = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject (_availability_,_$httpBackend_,_$q_,_$rootScope_) ->
    $rootScope = _$rootScope_
    $q = _$q_
    deferred = $q.defer()
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/api/test').respond deferred.promise
    availability = _availability_
    availability.check('test').then (data) ->
      result = data

  it 'should return true if domain is available', ->
    deferred.resolve true
    $httpBackend.flush()
    $rootScope.$apply()
    expect(result).toBe true

  it 'should return false if domain isn\'t available', ->
    deferred.resolve false
    $httpBackend.flush()
    $rootScope.$apply()
    expect(result).toBe false
