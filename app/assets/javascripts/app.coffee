askarangular = angular.module('askarangular',[
  'templates',
  'ngRoute',
  'controllers',
])

askarangular.config([ '$routeProvider',
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
controllers.controller("ElementsController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.elements = elements.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.elements = []
])

