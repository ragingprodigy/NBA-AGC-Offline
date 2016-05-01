'use strict'

describe 'Controller: NonLawyersCtrl', ->

  # load the controller's module
  beforeEach module 'nbaAgcOfflineApp'
  NonLawyersCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NonLawyersCtrl = $controller 'NonLawyersCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
