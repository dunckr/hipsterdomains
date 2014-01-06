angular.module('hipsterdomainsApp')
  .factory 'domain', (availability) ->

    class Domain

      constructor: (@name) ->
        @availability = null

      check: ->
        availability.check(@name).then (result) =>
          @availability = result.availability
