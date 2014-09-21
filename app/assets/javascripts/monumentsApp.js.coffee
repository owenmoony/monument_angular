monumentsApp = angular.module('monumentsApp', ['ngResource', 'ngRoute', 'mk.editablespan', 'ui.sortable'])

monumentsApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

monumentsApp.config ($routeProvider, $locationProvider) ->
  console.log('setting up')
  $locationProvider.html5Mode true
  $routeProvider.when '/', redirectTo: '/dashboard'
  $routeProvider.when '/dashboard', templateUrl: '/templates/dashboard.html', controller: 'DashboardCtrl'
  $routeProvider.when '/monument_groups/:monument_group_id', templateUrl: '/templates/monument_group.html', controller: 'MonumentGroupCtrl'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
