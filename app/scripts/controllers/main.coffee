class MainCtrl

  constructor: (@$scope, @suggestions) ->
    @_defaults()
    @scopes()

  scopes: =>
    @$scope.search = =>
      @_reset()
      @searching = true
      @$scope.list = @suggestions.generate @$scope.name

    @$scope.loadMore = =>
      return false unless @searching
      if @counter < @$scope.list.length
        @$scope.list[@counter].check()
        @counter++

  _defaults: ->
    @searching = false
    @$scope.name = 'startup'
    @_reset()

  _reset: ->
    @counter = 0
    @$scope.list = []

angular.module('hipsterdomainsApp')
  .controller 'mainCtrl', ['$scope','suggestions',MainCtrl]
