class Suffix

  constructor: ->
    console.log 'suffix bitch'

  fixture: ->
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

angular.module('hipsterdomainsApp')
  .value 'suffix', [Suffix]


# angular.module('hipsterdomainsApp')
#   .value 'suffix',
#     [
#       'a'
#       'ah'
#       'e'
#       'i'
#       'o'
#       'y'
#       'ey'
#       'er'
#       'r'
#       'ance'
#       'al'
#       'ery'
#       'oid'
#       'ious'
#       'ize'
#       'ism'
#       'ist'
#       'ish'
#       'aholic'
#       'able'
#       'ient'
#       'ion'
#       'ly'
#       'ify'
#       'ic'
#       'app'
#     ]
