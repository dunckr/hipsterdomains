angular.module('hipsterdomainsApp')
  .factory 'Suggestions', (Availability,Suffix) ->

    class Suggestions

      constructor: ->
        @list = []

      generate: (name) ->
        @_clear()
        @_find name
        @list

      availability: ->
        Availability.check()

      _find: (name) ->
        @list.push "#{name}#{suffix}" for suffix in @_suffixes()

      _clear: ->
        @list = []

      _suffixes: ->
        Suffix

    new Suggestions()

