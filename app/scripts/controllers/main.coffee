'use strict'

angular.module('hipsterdomainsApp')
  .controller 'MainCtrl', ['$scope', '$http', ($scope, $http) ->

    $http.get('/api/test').success (domains) ->
      $scope.domains = domains


  ]
