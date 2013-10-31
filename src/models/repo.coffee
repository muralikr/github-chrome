class @Repo extends Backbone.Model
  issuesUrl: -> [@get("html_url"), "issues"].join("/")
  pullRequestsUrl: -> [@get("html_url"), "pulls"].join("/")
  commitsUrl: -> [@get("html_url"), "commits"].join("/")
  milestonesUrl: -> [@get("html_url"), "milestones"].join("/")
  pullRequests: ->
    new PullRequestsCollection(this)
  milestones: ->
    mile_stones = new MilestoneCollection(this)
  setAssignee: ->
    assignee = new UserCollection()
    assignee.add(@get('owner'))
    @set('assignee', assignee)
