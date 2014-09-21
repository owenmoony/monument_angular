angular.module('monumentsApp').controller "DashboardCtrl", ($scope, $routeParams, $location, MonumentGroup) ->

  $scope.init = ->
    @groupService = new MonumentGroup(serverErrorHandler)
    $scope.groups = @groupService.all()

  $scope.createGroup = (name) ->
    @groupService.create name: name, (group) ->
      $location.url("/monument_groups/#{group.id}")

  $scope.deleteGroup = (group, index) ->
    result = confirm("Are you sure you want to remove this group?")

    if result
      @groupService.delete(group)
      $scope.groups.splice(index, 1)

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")
