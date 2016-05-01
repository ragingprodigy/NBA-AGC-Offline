'use strict'

describe 'Controller: MagistratesCtrl', ->

  # load the controller's module
  beforeEach module 'nbaAgcOfflineApp'
  MagistratesCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MagistratesCtrl = $controller 'MagistratesCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
