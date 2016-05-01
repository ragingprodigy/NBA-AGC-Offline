'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'login',
    url: '/login'
    guestView: true
    templateUrl: 'app/login/login.html'
    controller: 'LoginCtrl'
