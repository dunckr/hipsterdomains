class MainCtrl

  constructor: (@$scope, @suggestions) ->
    @_defaults()
    @scopes()

  scopes: =>
    @$scope.search = =>
      @_reset()
      @searching = true
      @suggestions.generate @$scope.name
      @$scope.list.push.apply @$scope.list, @suggestions.next @counter

    @$scope.loadMore = =>
      return false unless @searching
      @counter++
      @$scope.list.push.apply @$scope.list, @suggestions.next @counter

  _defaults: ->
    @searching = false
    @$scope.name = 'startup'
    @_reset()

  _reset: ->
    @counter = 0
    @$scope.list = []

angular.module('hipsterdomainsApp')
  .controller 'mainCtrl', ['$scope','suggestions',MainCtrl]
