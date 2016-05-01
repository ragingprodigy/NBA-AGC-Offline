'use strict'

angular.module 'nbaAgcOfflineApp'
.service 'Auth', ($resource) ->
  # AngularJS will instantiate a singleton by calling 'new' on this function
  $resource '/auth/:id', null, update: method:'PUT'