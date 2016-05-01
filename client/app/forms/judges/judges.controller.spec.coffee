'use strict'

describe 'Controller: JudgesCtrl', ->

  # load the controller's module
  beforeEach module 'nbaAgcOfflineApp'
  JudgesCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    JudgesCtrl = $controller 'JudgesCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
