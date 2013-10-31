class @MilestoneCollection extends Backbone.Collection
  initialize: (repo) ->
    @repo = repo

  model: MilestoneModel
  url: -> ['https://api.github.com/repos', @repo.get('full_name'), "milestones"].join("/")

