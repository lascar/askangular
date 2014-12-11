element = angular.module('element',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

element.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ElementsController'
      )
])

controllers = angular.module('controllers',[])

