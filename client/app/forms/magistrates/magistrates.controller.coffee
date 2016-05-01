'use strict'

angular.module 'nbaAgcOfflineApp'
.controller 'MagistratesCtrl', ($scope, Member, toastr, Bags, $rootScope, Registration, $state) ->
  $scope.secondForm = true

  $scope.data =
    registrationType: 'magistrate'
    tag: {}
    member: ''
    firstName: ''
    middleName: ''
    surname: ''
    conferenceFee: 50000
    _staff_: $rootScope.$user.sub

  $scope.bags = Bags.query()

  $scope.selectBag = (index) ->
    chosenBag = $scope.bags[index].name
    toastr.info "#{chosenBag} has been selected", "BAG SELECTED", timeOut: 500
    $scope.data.bag = chosenBag

  $scope.stageThree = (theForm) ->
    if $scope.secondForm and theForm.$valid
      $scope.data.tag.prefix = angular.copy $scope.data.prefix
      $scope.data.tag.name = "#{$scope.data.firstName} #{$scope.data.middleName.substring(0, 1)} #{$scope.data.surname}"
      $scope.data.tag.suffix = angular.copy $scope.data.suffix
      $scope.data.tag.company = "#{$scope.data.court} #{$scope.data.division} #{$scope.data.state}"

      $scope.secondForm = false
      $scope.thirdForm = true

  $scope.stageFour = ->
    if $scope.thirdForm and $scope.data.bag.length
      $scope.fourthForm = true
      $scope.thirdForm = false

  $scope.submit = ->
    # Submit the Data
    reg = new Registration $scope.data
    reg.$save().then (user) ->
      toastr.success "Registration Successful!<br><br>Username: <b> #{user.email}</b><br>Password: <b> 123456</b>", 'SUCCESS!',
        allowHtml: true
        timeOut: 10000
      $state.go 'new_registration'
    , (err) ->
      toastr.error err.message