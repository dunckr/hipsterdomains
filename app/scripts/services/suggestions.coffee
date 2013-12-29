angular.module('hipsterdomainsApp')
  .factory 'suggestions', (suffix,domain) ->

    class Suggestions

      constructor: ->
        @list = []

      generate: (name) ->
        @_empty()
        @_find name
        @list

      _find: (name) ->
        for suffix in @_suffixes()
          @list.push new domain "#{name}#{suffix}"

      _empty: ->
        @list = []

      _suffixes: ->
        suffix

    new Suggestions()

