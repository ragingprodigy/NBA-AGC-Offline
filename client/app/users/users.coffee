'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'users',
    url: '/users'
    templateUrl: 'app/users/users.html'
    controller: 'UsersCtrl'

  .state 'users.password',
    url: '/change_password/:user'
    requireLogin: true
    templateUrl: 'app/users/password.html'
    controller: 'PasswordCtrl'
