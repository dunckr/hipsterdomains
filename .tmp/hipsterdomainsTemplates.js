angular.module('hipsterdomainsTemplates', ['/hipsterdomains/todo/todo.html']);

angular.module("/hipsterdomains/todo/todo.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("/hipsterdomains/todo/todo.html",
    "\n" +
    "<h3>Todo</h3>\n" +
    "<ul class=\"unstyled\">\n" +
    "  <li class=\"todo-item\" ng-repeat=\"todo in todos\" ng-class=\"{'todo-done': todo.isDone}\">\n" +
    "    <label><input type=\"checkbox\" ng-click=\"check()\" ng-model=\"todo.isDone\"/> {{todo.label}}</label>\n" +
    "  </li>\n" +
    "  <li class=\"todo-item\">\n" +
    "    <form ng-submit=\"add()\">\n" +
    "      <input type=\"text\" placeholder=\"New item...\" ng-model=\"label\"/>\n" +
    "      <button type=\"submit\" ng-disabled=\"posting || !label\">Add</button>\n" +
    "    </form>\n" +
    "  </li>\n" +
    "</ul>\n" +
    "");
}]);
