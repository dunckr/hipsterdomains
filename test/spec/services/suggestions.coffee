describe 'Service: Suggestions', ->
  suggestions = availability = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject (_suggestions_) ->
    suggestions = _suggestions_

  it 'should be defined', ->
    expect(suggestions).toBeDefined()

  it 'should create list of alternatives', ->
    suggestions.generate 'test'
    expect(suggestions.list.length).toBeGreaterThan 1

  it 'should get the next bunch in the list', ->
    list = suggestions.generate 'test'
    expect(suggestions.next(0).length).toEqual 5

  it 'should not return the same bunch in the list', ->
    list = suggestions.generate 'test'
    first = suggestions.next 0
    expect(suggestions.next(1).length).not.toEqual first

  it 'should should return nothing if next is empty', ->
    expect(suggestions.next(0)).toEqual []

  it 'should call check on the item in sublist', ->
    list = suggestions.generate 'test'
    spyOn(list[0],'check')
    suggestions.next 0
    expect(list[0].check).toHaveBeenCalled()
