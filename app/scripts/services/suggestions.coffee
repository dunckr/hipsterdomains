angular.module('hipsterdomainsApp')
  .factory 'suggestions', (availability,suffix) ->

    class Suggestions

      constructor: ->
        @list = []

      generate: (name) ->
        @_clear()
        @_find name
        @list

      availability: ->
        availability.check()

      _find: (name) ->
        @list.push "#{name}#{suffix}" for suffix in @_suffixes()

      _clear: ->
        @list = []

      _suffixes: ->
        suffix

    new Suggestions()

