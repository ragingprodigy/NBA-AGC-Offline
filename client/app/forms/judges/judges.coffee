'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'judges',
    url: '/judges'
    templateUrl: 'app/forms/judges/judges.html'
    controller: 'JudgesCtrl'
