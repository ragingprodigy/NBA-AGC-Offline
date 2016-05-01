'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'others',
    url: '/others'
    templateUrl: 'app/forms/others/others.html'
    controller: 'OthersCtrl'
