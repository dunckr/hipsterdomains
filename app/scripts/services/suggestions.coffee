angular.module('hipsterdomainsApp')
  .factory 'suggestions', (suffix,domain) ->

    class Suggestions

      constructor: (@suffix) ->
        @list = []

      generate: (name) ->
        @_empty()
        @_find name
        @list

      next: (index) ->
        index *= 5
        sublist = @list[index..index+4]
        @_check sublist
        sublist

      _check: (sublist) ->
        for item in sublist
          item.check()

      _find: (name) ->
        for suffix in @_suffixes()
          @list.push new domain "#{name}#{suffix}"

      _empty: ->
        @list = []

      _suffixes: ->
        @suffix

    new Suggestions suffix
