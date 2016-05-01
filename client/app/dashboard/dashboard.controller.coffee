'use strict'

angular.module 'nbaAgcOfflineApp'
.controller 'DashboardCtrl', ($scope, $rootScope) ->

  $rootScope.$on "statsGotten", (e, data) ->
    $scope.stats = data