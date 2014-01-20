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
            <button type="button" class="btn btn-labeled btn-info">
              <span class="btn-label">
                <i class="fa fa-arrow-circle-o-right fa-2x"></i>
              </span>
              <h4>Success</h4>
            </button>
        </div>
      </div>
    '
    link: ($scope, element, attrs) ->
        element.bind 'click', (event) =>
          # console.log $scope.domain
          $scope.clicked = true
          $scope.$apply()
