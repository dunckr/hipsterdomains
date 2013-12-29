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
