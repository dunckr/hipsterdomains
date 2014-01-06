class MainCtrl

  constructor: (@$scope, @suggestions) ->
    @_defaults()
    @scopes()

  scopes: =>
    @$scope.search = =>
      @searching = true
      @$scope.list = @suggestions.generate @$scope.name

    @$scope.loadMore = =>
      return false unless @searching
      if @counter < @$scope.list.length
        @$scope.list[@counter].check()
        @counter++

  _defaults: ->
    @searching = false
    @counter = 0
    @$scope.name = 'startup'
    @$scope.list = []

  # constructor: (@$scope, @suggestions) ->
  #   @$scope.name = 'startup'
  #   @$scope.current = @$scope.name
  #   @$scope.list = []

  #   @$scope.search = =>
  #     @$scope.list = @suggestions.generate @$scope.name
  #     @$scope.current = @$scope.name

  #   @$scope.loadMore = =>
  #     return false if @$scope.current.length is 0 or @$scope.list.length is 0
  #     @$scope.current = @$scope.current.slice 0, -1
  #     @$scope.list = @$scope.list.concat @suggestions.generate @$scope.current

angular.module('hipsterdomainsApp')
  .controller 'mainCtrl', ['$scope','suggestions',MainCtrl]
