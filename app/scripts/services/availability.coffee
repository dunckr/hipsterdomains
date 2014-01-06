angular.module('hipsterdomainsApp')
  .factory 'availability', ($http,$q) ->

    class Availability

      constructor: (@$http, @$q) ->

      check: (name) ->
        deferred = @$q.defer()
        $http
          .get("/api/#{name}")
          .success (result) =>
            deferred.resolve(result)
          .error (result) =>
            deferred.resolve availability: false
        deferred.promise

    new Availability $http, $q
