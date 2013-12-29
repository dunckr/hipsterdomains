describe 'Service: Suggestions', ->
  suggestions = Availability = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject (_Suggestions_,_Availability_) ->
    suggestions = _Suggestions_
    Availability = _Availability_
    Availability.check = jasmine.createSpy().andReturn()

  it 'should be defined', ->
    expect(suggestions).toBeDefined()

  it 'should take search request and provide alternatives', ->
    expect(suggestions.generate('test')).toContain 'testly', 'tests'

  it 'should check the Availability of alternatives', ->
    suggestions.availability()
    expect(Availability.check).toHaveBeenCalled()
