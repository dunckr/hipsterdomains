class MainCtrl

  constructor: (@$scope, @Suggestions) ->
    @$scope.name = 'startup'
    @$scope.search = =>
      console.log 'trying to search'
      @Suggestions.test()

      @$scope.list = @Suggestions.generate @$scope.name

angular.module('hipsterdomainsApp')
  .controller 'mainCtrl', ['$scope','Suggestions',MainCtrl]
