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

  # it 'should set the default url', ->
  #   expect(scope.url).toEqual '0AtNU_KBGgbVfdEdqM1VQUTlkME1sNkF1aDZlcW03TWc'

  # it 'should change the path on doc request', ->
  #   scope.url = 'interesting'
  #   scope.request()
  #   expect($location.path()).toEqual '/doc/interesting'

  # it 'should change the path on gist request', ->
  #   scope.url = 'https://gist.github.com/dunckr/7683567/raw/269f91c37504eb127288c642ba7aa96ee6242950/Patterns'
  #   scope.request()
  #   expect($location.path()).toEqual '/gist/7683567'

  # it 'should change the path on doc request', ->
  #   scope.url = 'https://docs.google.com/spreadsheet/pub?key=0AtNU_KBGgbVfdEdqM1VQUTlkME1sNkF1aDZlcW03TWc&output=html'
  #   scope.request()
  #   expect($location.path()).toEqual '/doc/0AtNU_KBGgbVfdEdqM1VQUTlkME1sNkF1aDZlcW03TWc'


# 'use strict'

# describe 'Controller: MainCtrl', () ->

#   # load the controller's module
#   beforeEach module 'hipsterdomainsApp'

#   MainCtrl = {}
#   scope = {}
#   $httpBackend = {}

#   # Initialize the controller and a mock scope
#   beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
#     $httpBackend = _$httpBackend_
#     $httpBackend.expectGET('/api/awesomeThings').respond ['HTML5 Boilerplate', 'AngularJS', 'Karma', 'Express']
#     scope = $rootScope.$new()
#     MainCtrl = $controller 'MainCtrl', {
#       $scope: scope
#     }

#   it 'should attach a list of awesomeThings to the scope', () ->
#     expect(scope.awesomeThings).toBeUndefined()
#     $httpBackend.flush()
#     expect(scope.awesomeThings.length).toBe 4
