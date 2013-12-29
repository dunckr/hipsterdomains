class MainCtrl

  constructor: (@$scope, @Suggestions) ->
    @$scope.name = 'startup'
    @$scope.search = =>
      @$scope.list = @Suggestions.generate @$scope.name

angular.module('hipsterdomainsApp')
  .controller 'mainCtrl', ['$scope','Suggestions',MainCtrl]
