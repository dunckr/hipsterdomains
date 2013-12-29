angular.module('hipsterdomainsApp')
  .factory 'domain', (availability) ->

    class Domain

      constructor: (@name) ->
        @availablity = null
        availability.check(@name).then (result) =>
          @availablity = result.availablity
