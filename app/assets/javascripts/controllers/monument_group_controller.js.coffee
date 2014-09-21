angular.module('monumentsApp').controller "MonumentGroupCtrl", ($scope, $timeout, $routeParams, MonumentGroup) ->

  $scope.init = () ->
    console.log('about to find the group...', $routeParams)
    @groupService = new MonumentGroup(serverErrorHandler)
    $scope.group = @groupService.find($routeParams.monument_group_id)


  $scope.groupNameEdited = (groupName) ->
    console.log('1group name edited..', groupName)
    console.log('2group name edited..', @group)
    @groupService.update(@group, name: groupName)

  $scope.testingThis = ->
    console.log('wtf')

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")