'use strict'

describe 'Service: registration', ->

  # load the service's module
  beforeEach module 'nbaAgcOfflineApp'

  # instantiate service
  registration = undefined
  beforeEach inject (_registration_) ->
    registration = _registration_

  it 'should do something', ->
    expect(!!registration).toBe true
