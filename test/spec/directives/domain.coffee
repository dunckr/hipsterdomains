describe 'Directive: question', ->
  element = scope = null

  beforeEach module 'hipsterdomainsApp'
  beforeEach inject ($rootScope, _$compile_) ->
    $compile = _$compile_
    scope = $rootScope.$new()
    scope.domain = name: 'one'
    html = '<domain model="domain"/>'
    element = angular.element html
    element = $compile(element) scope
    $rootScope.$digest()

  it 'should diplay the answer on click', ->
    element.triggerHandler 'click'
    scope.$digest()
    expect(element.find('div').eq(1).hasClass('ng-hide')).toBe false
