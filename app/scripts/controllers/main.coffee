class MainCtrl

  constructor: (@$scope, @suggestions) ->
    @$scope.name = 'startup'
    @$scope.search = =>
      @$scope.list = @suggestions.generate @$scope.name

angular.module('hipsterdomainsApp')
  .controller 'mainCtrl', ['$scope','suggestions',MainCtrl]
