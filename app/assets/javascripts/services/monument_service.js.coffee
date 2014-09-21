angular.module('monumentsApp').factory 'Monument', ($resource, $http) ->
  class Monument
    constructor: (monumentGroupId, errorHandler) ->
      @service = $resource('/api/monument_groups/:monument_group_id/monuments/:id', {monument_group_id: monumentGroupId, id: '@id'},
        update:
          method: 'PATCH'
      )
      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs) ->
      new @service(monument: attrs).$save ((monument) -> attrs.id = monument.id), @errorHandler
      attrs

    delete: (monument) ->
      new @service().$delete {id: monument.id}, (-> null), @errorHandler

    update: (monument, attrs) ->
      new @service(monument: attrs).$update {id: monument.id}, (-> null), @errorHandler

    all: ->
      @service.query((-> null), @errorHandler)
