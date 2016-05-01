'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'new_registration',
    url: '/new_registration'
    templateUrl: 'app/new_registration/new_registration.html'
    controller: 'NewRegistrationCtrl'
