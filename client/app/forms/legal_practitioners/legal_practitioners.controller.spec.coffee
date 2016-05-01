'use strict'

describe 'Controller: LegalPractitionersCtrl', ->

  # load the controller's module
  beforeEach module 'nbaAgcOfflineApp'
  LegalPractitionersCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LegalPractitionersCtrl = $controller 'LegalPractitionersCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
