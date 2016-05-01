'use strict'

describe 'Controller: SanAndBenchCtrl', ->

  # load the controller's module
  beforeEach module 'nbaAgcOfflineApp'
  SanAndBenchCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SanAndBenchCtrl = $controller 'SanAndBenchCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
