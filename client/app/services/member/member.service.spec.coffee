'use strict'

describe 'Service: member', ->

  # load the service's module
  beforeEach module 'nbaAgcOfflineApp'

  # instantiate service
  member = undefined
  beforeEach inject (_member_) ->
    member = _member_

  it 'should do something', ->
    expect(!!member).toBe true
