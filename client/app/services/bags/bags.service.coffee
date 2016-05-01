'use strict'

angular.module 'nbaAgcOfflineApp'
.service 'Bags', ($resource) ->
  # AngularJS will instantiate a singleton by calling 'new' on this function
  $resource '/api/bags/:id', null, choose: method: 'POST'