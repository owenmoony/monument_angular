angular.module('monumentsApp').factory 'MonumentGroup', ($resource, $http) ->
  class MonumentGroup
    constructor: (errorHandler) ->
      @service = $resource('/api/monument_groups/:id', {id: '@id'},
        query:
          method:'GET',
          isArray:true
        update:
          method: 'PATCH'
      )
      @errorHandler = errorHandler

      # use application/json content type in requests
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs, successHandler) ->
      new @service(monument_group: attrs).$save ((list) -> successHandler(list)), @errorHandler

    delete: (list) ->
      new @service().$delete {id: list.id}, (-> null), @errorHandler

    update: (group, attrs) ->
      new @service(monument_group: attrs).$update({id: group.id}, (-> null), @errorHandler)

    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      console.log('finding one', id)
      @service.get(id: id, ((group)->
        console.log('group', group)
        successHandler?(group)
        group),
       @errorHandler)

