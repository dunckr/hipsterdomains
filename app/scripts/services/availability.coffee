angular.module('hipsterdomainsApp')
  .factory 'Availability', ($http,$q) ->

    class Availability

      constructor: (@$http, @$q) ->

      check: (name) ->
        deferred = @$q.defer()
        $http.get('/api/awesomeThings').success (result) =>
          deferred.resolve result
        deferred.promise

      # request: (name) ->

      # get: (id) ->
      #   @_Domains @_constructUrl id

      # _domains: (url) ->
      #   deferred = @$q.defer()
      #   @$http.jsonp(url).success (data) =>
      #     deferred.resolve @_process data
      #   deferred.promise

      # _process: (data) ->
      #   data

      # _constructUrl: (id) ->
      #   ''
