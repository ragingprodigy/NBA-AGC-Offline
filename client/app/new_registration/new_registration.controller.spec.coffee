'use strict'

describe 'Controller: NewRegistrationCtrl', ->

  # load the controller's module
  beforeEach module 'nbaAgcOfflineApp'
  NewRegistrationCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NewRegistrationCtrl = $controller 'NewRegistrationCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
