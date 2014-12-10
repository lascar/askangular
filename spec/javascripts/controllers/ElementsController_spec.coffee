describe "ElementsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null

  setupController =(keywords)->
    inject(($location, $routeParams, $rootScope, $resource, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      ctrl        = $controller('ElementsController',
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("element"))
  beforeEach(setupController())

  it 'defaults to no elements', ->
    expect(scope.elements).toEqualData([])
