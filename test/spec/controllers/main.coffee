describe 'Controller: MainCtrl', () ->
  controller = scope = suggestions = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject ($controller, _$rootScope_,_suggestions_) ->
    $rootScope = _$rootScope_
    scope = $rootScope.$new()
    suggestions = _suggestions_
    suggestions.generate = jasmine.createSpy().andReturn()
    controller = $controller 'MainCtrl',
      $scope: scope
      suggestions: suggestions

  it 'should initialize', ->
    expect(controller).toBeDefined()

  it 'should have name initialized', ->
    expect(scope.name).toEqual 'startup'

  describe 'find suggestions', ->

    beforeEach ->
      scope.search()

    it 'should set the current seed', ->
      expect(scope.current).toEqual 'startup'

    it 'should generate suggestions', ->
      expect(suggestions.generate).toHaveBeenCalled()

  it 'should not load more if not begun searching', ->
    scope.loadMore()
    expect(suggestions.generate).not.toHaveBeenCalled()

  describe 'load more', ->

    additional = ['one']

    beforeEach ->
      suggestions.generate = jasmine.createSpy().andReturn additional
      scope.search()
      scope.loadMore()

    it 'should reduce the current seed by 1', ->
      expect(scope.current).toEqual 'startu'

    it 'should not load more if current seed empty', ->
      scope.current = ''
      scope.loadMore()
      expect(suggestions.generate.callCount).toBe 2

    it 'should load more with the current seed', ->
      expect(suggestions.generate).toHaveBeenCalledWith 'startu'

    it 'should append these new additional results to the list', ->
      expect(scope.list).toContain 'one'

