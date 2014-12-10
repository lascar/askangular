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

elements = [
  {
    id: 1
    name: 'Element 1'
  },
  {
    id: 2
    name: 'Element 2',
  },
  {
    id: 3
    name: 'Element 3',
  },
  {
    id: 4
    name: 'Element 4',
  },
]
controllers = angular.module('controllers',[])
controllers.controller("ElementsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.elements = elements.filter (element)-> element.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.elements = []
])

