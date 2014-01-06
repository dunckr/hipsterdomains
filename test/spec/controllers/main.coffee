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

    it 'should reset the counter', ->
      expect(controller.counter).toEqual 0

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
