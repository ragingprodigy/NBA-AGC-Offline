'use strict'

angular.module 'nbaAgcOfflineApp'
.controller 'LoginCtrl', ($scope, $auth, $window, toastr) ->
  $scope.login = ->
    $auth.login
      email: $scope.email
      password: $scope.password
    .then ->
      toastr.success 'Login Successful!'
      $window.location.href = '/'
    , (e) ->
      toastr.error e.data.message