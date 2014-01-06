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
        console.log '@_suffixes()',@_suffixes().length
        for suffix in @_suffixes()
          @list.push new domain "#{name}#{suffix}"

      _empty: ->
        @list = []

      _suffixes: ->
        [
          'a'
          'ah'
          'e'
          'i'
          'o'
          'y'
          'ey'
          'er'
          'r'
          'ance'
          'al'
          'ery'
          'oid'
          'ious'
          'ize'
          'ism'
          'ist'
          'ish'
          'aholic'
          'able'
          'ient'
          'ion'
          'ly'
          'ify'
          'ic'
          'app'
        ]


    new Suggestions()

