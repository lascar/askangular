controllers = angular.module('controllers')
controllers.controller("ElementsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Element = $resource('/elements/:elementId', { elementId: "@id", format: 'json' })

    if $routeParams.keywords
      Element.query(keywords: $routeParams.keywords, (results)-> $scope.elements = results)
    else
      $scope.elements = []
])

