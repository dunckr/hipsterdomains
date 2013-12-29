angular.module('hipsterdomainsApp')
  .factory 'suggestions', (suffix,domain) ->

    class Suggestions

      constructor: ->
        @list = []

      generate: (name) ->
        @_clear()
        @_find name
        @list

      # availability: ->
      #   availability.check()

      _find: (name) ->
        for suffix in @_suffixes()
          console.log suffix
          @list.push new domain "#{name}#{suffix}"

        # @list.push "#{name}#{suffix}" for suffix in @_suffixes()

        # for suffix in @_suffixes()
        #   name = "#{name}#{suffix}"
        #   @list[name]

      _clear: ->
        @list = []

      _suffixes: ->
        suffix

    new Suggestions()

