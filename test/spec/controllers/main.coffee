describe 'Controller: MainCtrl', () ->
  controller = scope = suggestions = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject ($controller, _$rootScope_,_Suggestions_) ->
    $rootScope = _$rootScope_
    scope = $rootScope.$new()
    suggestions = _Suggestions_
    suggestions.generate = jasmine.createSpy().andReturn()
    controller = $controller 'MainCtrl',
      $scope: scope
      suggestions: suggestions

  it 'should initialize', ->
    expect(controller).toBeDefined()

  it 'should have name initialized', ->
    expect(scope.name).toEqual 'startup'

  it 'should find suggestions', ->
    scope.search()
    expect(suggestions.generate).toHaveBeenCalled()
