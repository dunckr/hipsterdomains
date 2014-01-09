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
        <div class="panel-body" ng-show="clicked">
            <button type="button" class="btn btn-default">Default</button>
            <button type="button" class="btn btn-default">Default</button>
        </div>
      </div>
    '
    link: ($scope, element, attrs) ->
        element.bind 'click', (event) =>
          $scope.clicked = true
          $scope.$apply()


        # <div class="panel panel-default">
        #   <div class="panel-heading">
        #     <h2 class="panel-title" >{{domain.name}}<small>.com</small></h2>
        #     <div class="pull-right">
        #       <i ng-class="{'fa fa-spinner fa-spin fa-3x': domain.availability==null}"></i>
        #       <i ng-class="{'fa fa-thumbs-up fa-3x': domain.availability==true}"></i>
        #       <i ng-class="{'fa fa-thumbs-down fa-3x': domain.availability==false}"></i>
        #     </div>
        #   </div>
        #   <div class="panel-body">
            # <button type="button" class="btn btn-default">Default</button>
            # <button type="button" class="btn btn-default">Default</button>
        #     <button type="button" class="btn btn-default">Default</button>
        #     <button type="button" class="btn btn-default">Default</button>
        #   </div>
        # </div>
