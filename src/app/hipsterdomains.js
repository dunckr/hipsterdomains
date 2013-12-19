
angular.module('hipsterdomains', [
  'ngRoute',
  'hipsterdomains.todo',
  'restangular','hipsterdomainsTemplates'
])
.config(function ($routeProvider, RestangularProvider) {
  'use strict';
  $routeProvider
    .when('/todo', {
      controller: 'TodoCtrl',
      templateUrl: '/hipsterdomains/todo/todo.html'
    })
    .otherwise({
      redirectTo: '/todo'
    });

  RestangularProvider.setBaseUrl('/api');
});
