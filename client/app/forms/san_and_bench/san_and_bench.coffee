'use strict'

angular.module 'nbaAgcOfflineApp'
.config ($stateProvider) ->
  $stateProvider.state 'san_and_bench',
    url: '/san_and_bench'
    templateUrl: 'app/forms/san_and_bench/san_and_bench.html'
    controller: 'SanAndBenchCtrl'
