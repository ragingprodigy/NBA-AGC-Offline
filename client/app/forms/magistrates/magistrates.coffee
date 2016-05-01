'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'magistrates',
    url: '/magistrates'
    templateUrl: 'app/forms/magistrates/magistrates.html'
    controller: 'MagistratesCtrl'
