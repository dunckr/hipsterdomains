'use strict'

angular.module('hipsterdomainsApp')
  .controller 'MainCtrl', ['$scope', '$http', ($scope, $http) ->

    $http.get('/api/121221').success (domains) ->
      $scope.domains = domains


  ]
