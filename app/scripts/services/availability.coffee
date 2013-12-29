angular.module('hipsterdomainsApp')
  .factory 'Availability', ($http,$q) ->

    class Availability

      constructor: (@$http, @$q) ->

      check: (name) ->
        deferred = @$q.defer()
        $http.get("/api/#{name}").success (result) =>
          deferred.resolve result
        deferred.promise

    new Availability $http, $q
