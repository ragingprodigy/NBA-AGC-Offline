'use strict'

angular.module 'nbaAgcOfflineApp'
.controller 'LegalPractitionersCtrl', ($scope, Member, toastr, Bags, $rootScope, Registration, $state) ->

  $scope.firstForm = true

  $scope.data =
    registrationType: 'legalPractitioner'
    tag: {}
    member: ''
    firstName: ''
    middleName: ''
    surname: ''
    _staff_: $rootScope.$user.sub

  $scope.bags = Bags.query()

  $scope.selectBag = (index) ->
    chosenBag = $scope.bags[index].name
    toastr.info "#{chosenBag} has been selected", "BAG SELECTED", timeOut: 500
    $scope.data.bag = chosenBag

  $scope.getFees = (member) ->
    # Get the Fee Due
    currentYear = new Date().getFullYear()
    atTheBar = currentYear - member.yearCalled
    feeDue = 80000

    if atTheBar <= 5 then feeDue = 15000
    else if atTheBar <= 10 then feeDue = 25000
    else if atTheBar <= 14 then feeDue = 40000
    else if atTheBar <= 20 then feeDue = 50000

    feeDue

  $scope.chooseMember = (member) ->
    $scope.data.member = member._id
    $scope.data.yearCalled = member.yearCalled
    $scope.data.nbaId = member.nbaId
    $scope.data.conferenceFee = $scope.getFees member

    toastr.success "Member Chosen!", null, timeOut: 700

  $scope.stageTwo = ->
    if $scope.data.member.length
      $scope.firstForm = false
      $scope.secondForm = true

  $scope.stageThree = (theForm) ->
    if $scope.secondForm and theForm.$valid
      $scope.data.tag.prefix = angular.copy $scope.data.prefix
      $scope.data.tag.name = "#{$scope.data.firstName} #{$scope.data.middleName.substring(0, 1)} #{$scope.data.surname}"
      $scope.data.tag.suffix = angular.copy $scope.data.suffix
      $scope.data.tag.company = angular.copy $scope.data.company

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

  $scope.doLookup = ->
    Member.query $scope.member
    .$promise.then (members) ->
      $scope.members = members