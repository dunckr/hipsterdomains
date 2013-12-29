describe 'Controller: MainCtrl', () ->
  mainCtrl = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject ($controller, _$rootScope_) ->
    $rootScope = _$rootScope_
    scope = $rootScope.$new()
    mainCtrl = $controller 'MainCtrl',
      $scope: scope

  it 'should initialize', ->
    expect(mainCtrl).toBeDefined()

  it 'should request domain name', ->
    expect(domains.request).toHaveBeenCalled()
