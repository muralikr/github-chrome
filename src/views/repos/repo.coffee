class @RepoView extends Backbone.View

  className: 'repo'
  tagName: 'li'

  render: ->
    @$el.html HAML['repo'](model: @model)
    @

  renderPullRequests: =>
    pull_requests = @model.pullRequests()
    pull_requests.fetch
      success: (collection) => 
        @model.set('pull_collection',collection)
        @$('.pull-requests-count').text(collection.length)
