'use strict'

describe 'Service: auth', ->

  # load the service's module
  beforeEach module 'nbaAgcOfflineApp'

  # instantiate service
  auth = undefined
  beforeEach inject (_auth_) ->
    auth = _auth_

  it 'should do something', ->
    expect(!!auth).toBe true
