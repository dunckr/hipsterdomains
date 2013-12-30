'use strict'

angular.module('hipsterdomainsApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'infinite-scroll'
])
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'mainCtrl'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode(true)
  ]
