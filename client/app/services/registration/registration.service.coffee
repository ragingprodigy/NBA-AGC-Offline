'use strict'

angular.module 'nbaAgcOfflineApp'
.service 'Registration', ($resource) ->
  # AngularJS will instantiate a singleton by calling 'new' on this function
  $resource '/api/registrations/:id', null,
    stats:
      method: 'GET'
      url: '/api/registrations/stats'