angular.module('hipsterdomainsApp')
  .directive 'domain', ->
    restrict: 'E'
    scope:
      domain: '=model'
    template: '
      <div class="panel panel-default"
        ng-class="{\'unknown\': domain.availability==null,\'available\': domain.availability==true,\'unavailable\': domain.availability==false}">
        <div class="panel-heading">
          <i ng-class="{\'fa fa-spinner fa-spin fa-3x unknown\': domain.availability==null}"></i>
          <i ng-class="{\'fa fa-thumbs-up fa-3x available\': domain.availability==true}"></i>
          <i ng-class="{\'fa fa-thumbs-down fa-3x unavailable\': domain.availability==false}"></i>
          <h3 class="panel-title name">{{domain.name}}<small>.com</small></h3>
        </div>
        <div class="panel-body link" ng-show="clicked">
          <a ng-href="https://www.name.com/domain/search?domain={{domain.name}}&utm_campaign=affiliate&utm_source=7307&utm_medium=&utm_content=
" target="_blank" class="btn btn-labeled btn-info">
            <span class="btn-label">
              <i class="fa fa-arrow-circle-o-right fa-2x"></i>
            </span>
            <h4>Name.com</h4>
          </a>
          <a ng-href="https://www.namecheap.com/domains/registration/results.aspx?domain={{domain.name}}&tlds=&searchall=&type=single&&utm_source=none&utm_medium=Affiliate&utm_campaign=60401
" target="_blank" class="btn btn-labeled btn-info">
            <span class="btn-label">
              <i class="fa fa-arrow-circle-o-right fa-2x"></i>
            </span>
            <h4>NameCheap.com</h4>
          </a>
        </div>
      </div>
    '
    link: ($scope, element, attrs) ->
        element.bind 'click', (event) =>
          if $scope.domain.availability is true
            $scope.clicked = true
            $scope.$apply()
