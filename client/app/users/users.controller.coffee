'use strict'

angular.module 'nbaAgcOfflineApp'
.controller 'UsersCtrl', ($scope, Auth, $auth, $state, toastr) ->

  $scope.users = Auth.query {}

  $scope.toggleForm = ->
    $scope.user = {}
    $scope.newUser = !$scope.newUser

  $scope.changePassword = (user)->
    $state.go 'user_accounts.password', user: user._id

  """$scope.changeAccess = ->
    if $scope.user.role is 'admin'
      $scope.user.actions =
        lp: true
        bencher: true
        judge: true
        magistrate: true
        other: true
        nl: true
    else $scope.user.actions = {}"""

  $scope.createUser = (formName) ->
    if formName.$valid
      $auth.signup $scope.user
      .then ->
        toastr.success 'Account Created Successfully', 'OK!'
        $scope.users.push $scope.user
        $scope.toggleForm()
      , (err) ->
        toastr.error err.data.message, 'Argh!'
        $scope.error = err.data.message

    else toastr.warning "Form not filled accurately"

.controller 'PasswordCtrl', ($scope, Auth, $stateParams, $state, toastr) ->

  if not $stateParams.user? then $scope.cancel()

  $scope.user = Auth.get {id: $stateParams.user}

  $scope.cancel = ->
    $state.go 'users'

  $scope.updatePassword = (form) ->
    if form.$valid
      Auth.update {id: $stateParams.user}, { password: $scope.new_password }, ->
        toastr.success "Update Successful!"
        $scope.cancel()
    else toastr.error 'Form not filled correctly'