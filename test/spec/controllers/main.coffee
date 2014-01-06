describe 'Controller: MainCtrl', () ->
  controller = scope = suggestions = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject ($controller, _$rootScope_,_suggestions_) ->
    $rootScope = _$rootScope_
    scope = $rootScope.$new()
    suggestions = _suggestions_
    results = [
      name:'one',check: jasmine.createSpy().andReturn true
    ]
    suggestions.generate = jasmine.createSpy().andReturn results
    controller = $controller 'MainCtrl',
      $scope: scope
      suggestions: suggestions

  describe 'on initialize', ->

    beforeEach ->
      scope.loadMore()

    it 'should have name placeholder', ->
      expect(scope.name).toEqual 'startup'

    it 'should initialize the counter', ->
      expect(controller.counter).toBe 0

    it 'should not be searching', ->
      expect(controller.searching).toBeFalsy()

    it 'should not load when not searching', ->
      expect(suggestions.generate).not.toHaveBeenCalled()

    it 'should have an empty list of results', ->
      expect(scope.list.length).toBe 0

  describe 'on search', ->

    beforeEach ->
      scope.search()

    it 'should set the searching', ->
      expect(controller.searching).toBeTruthy()

    it 'should request suggestions to generate list', ->
      expect(suggestions.generate).toHaveBeenCalled()

    it 'should save the results in list', ->
      expect(scope.list.length).toBe 1

  describe 'on load more after searched', ->

    beforeEach ->
      scope.search()
      scope.loadMore()

    it 'should increase the counter', ->
      expect(controller.counter).toEqual 1

    it 'should check the next suggestion', ->
      expect(scope.list[0].check).toHaveBeenCalled()

  describe 'if no more in list', ->

    beforeEach ->
      scope.search()
      scope.loadMore()
      scope.loadMore()

    it 'should should stop incrementing the counter', ->
      expect(controller.counter).toEqual 1


  # describe 'find suggestions', ->

  #   beforeEach ->
  #     scope.search()

  #   it 'should set the current seed', ->
  #     expect(scope.current).toEqual 'startup'

  #   it 'should generate suggestions', ->
  #     expect(suggestions.generate).toHaveBeenCalled()

  # it 'should not load more if not begun searching', ->
  #   scope.loadMore()
  #   expect(suggestions.generate).not.toHaveBeenCalled()

  # describe 'load more', ->

  #   additional = ['one']

  #   beforeEach ->
  #     suggestions.generate = jasmine.createSpy().andReturn additional
  #     scope.search()
  #     scope.loadMore()

  #   it 'should reduce the current seed by 1', ->
  #     expect(scope.current).toEqual 'startu'

  #   it 'should not load more if current seed empty', ->
  #     scope.current = ''
  #     scope.loadMore()
  #     expect(suggestions.generate.callCount).toBe 2

  #   it 'should load more with the current seed', ->
  #     expect(suggestions.generate).toHaveBeenCalledWith 'startu'

  #   it 'should append these new additional results to the list', ->
  #     expect(scope.list).toContain 'one'

