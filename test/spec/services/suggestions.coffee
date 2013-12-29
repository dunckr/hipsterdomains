describe 'Service: Suggestions', ->
  suggestions = availability = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject (_suggestions_,_availability_) ->
    suggestions = _suggestions_
    availability = _availability_
    availability.check = jasmine.createSpy().andReturn()

  it 'should be defined', ->
    expect(suggestions).toBeDefined()

  it 'should take search request and provide alternatives', ->
    expect(suggestions.generate('test')).toContain 'testly', 'tests'

  it 'should check the Availability of alternatives', ->
    suggestions.availability()
    expect(availability.check).toHaveBeenCalled()
