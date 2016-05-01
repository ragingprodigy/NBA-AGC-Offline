'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'dashboard',
    url: '/'
    templateUrl: 'app/dashboard/dashboard.html'
    controller: 'DashboardCtrl'
