'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'non_lawyers',
    url: '/non_lawyers'
    templateUrl: 'app/forms/non_lawyers/non_lawyers.html'
    controller: 'NonLawyersCtrl'
