'use strict'

angular.module 'nbaAgcOfflineApp'
.controller 'NavbarCtrl', ($scope, $location, $auth, $state, $rootScope, $timeout, Registration) ->

  $scope.headBoard = ->

    Registration.stats {}, (stats) ->
      $scope.stats = stats
      $rootScope.$broadcast "statsGotten", stats

      $timeout ->
        $scope.headBoard()
      , 30000

  $scope.headBoard()

  $scope.logout = ->
    if confirm 'Are you sure?'
      $auth.logout()
      $state.go 'login'

  $scope.isGuest = ->
    !$auth.isAuthenticated()

  $scope.notAdmin = ->
    $rootScope.$user.role isnt 'admin'

  $scope.isCollapsed = true

  $scope.isActive = (route) ->
    $location.path().indexOf route is 0