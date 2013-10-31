class @UserCollection extends Backbone.Collection
  model: User
  url: -> @_url

  initialize: (options = {}) ->
    @_url = options.url
