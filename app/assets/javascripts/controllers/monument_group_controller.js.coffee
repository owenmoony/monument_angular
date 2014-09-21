angular.module('monumentsApp').controller "MonumentGroupCtrl", ($scope, $timeout, $routeParams, MonumentGroup, Monument) ->

  $scope.init = () ->
    @groupService = new MonumentGroup(serverErrorHandler)
    @monumentService = new Monument($routeParams.monument_group_id, serverErrorHandler)
    $scope.group = @groupService.find($routeParams.monument_group_id)


  $scope.groupNameEdited = (groupName) ->
    @groupService.update(@group, name: groupName)

  $scope.addMonument = ->
    monument = @monumentService.create(name: $scope.monumentName)
    $scope.group.monuments.unshift(monument);
    $scope.monumentName = ''

  $scope.deleteMonument = (monument) ->
    @monumentService.delete(monument)
    $scope.group.monuments.splice($scope.group.monuments.indexOf(monument), 1)

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")