'use strict'

describe 'Controller: OthersCtrl', ->

  # load the controller's module
  beforeEach module 'nbaAgcOfflineApp'
  OthersCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    OthersCtrl = $controller 'OthersCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
