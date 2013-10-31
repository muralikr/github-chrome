class @NewIssueView extends Backbone.View

  className: 'new-issue'

  events:
    "submit form" : "onSubmit"
    "change select[name=repository]" : "onRepoChange"

  initialize: (@options) ->
    @repositories = @options.repositories
    todo = @repositories.models.length
    @repositories.each (model) =>
      model.setAssignee() if !model.get('assignee')
      if !model.get('milestone_collection')
        mile_stones = model.milestones()
        mile_stones.fetch
          success: (collection) => 
            model.set('milestone_collection',collection)
            todo--
            @render() if todo == 0
      else
        todo--
        @render() if todo == 0

  render: ->
    @$el.html(HAML['new_issue'](repositories: @repositories))
    @$('select').select2()

  onRepoChange: (e) ->
    e.preventDefault()
    name = @$("[name=repository]").val()
    localStorage['new_issue_last_repo'] = name
    @render()
    return;

  onSubmit: (e) ->
    e.preventDefault()
    name = @$("[name=repository]").val()
    localStorage['new_issue_last_repo'] = name
    repository = @repositories.find (r) -> r.get('full_name') == name
    model = new IssueModel({
      body: @$("[name=body]").val()
      title: @$("[name=title]").val()
    }, {repository: repository})
    model.save {},
      success: (model) =>
        @badge = new Badge()
        @badge.addIssues(1)
        @$('.message').html("<span>Issue <a href=\"#{model.get("html_url")}\" target=\"_blank\">##{model.get('number')}</a> was created!</span>")
      error: =>
        @$('.message').html("<span>Failed to create issue :(</span>")

