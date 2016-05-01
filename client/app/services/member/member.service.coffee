'use strict'

angular.module 'nbaAgcOfflineApp'
.service 'Member', ($resource)->
  # AngularJS will instantiate a singleton by calling 'new' on this function
  $resource '/api/members/:id'