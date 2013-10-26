class @MilestoneCollection extends Backbone.Collection
  model: MilestoneModel
  #url: @_url
  url: -> @_url

  initialize: (options = {}) ->
    @_url = options.url
    @_url ||= "https://api.github.com/repos"+localStorage['new_issue_last_repo']+"/milestones"
    #@_url += "/=#{localStorage['new_issue_last_repo']}/milestones"
    #@org = options.org

