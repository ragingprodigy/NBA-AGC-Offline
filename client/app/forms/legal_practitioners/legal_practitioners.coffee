'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'legal_practitioners',
    url: '/legal_practitioners'
    templateUrl: 'app/forms/legal_practitioners/legal_practitioners.html'
    controller: 'LegalPractitionersCtrl'
