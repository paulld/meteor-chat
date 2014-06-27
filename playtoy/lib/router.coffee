Router.configure(
  layoutTemplate: 'layout'
  loadingTemplate: 'loading',
  waitOn: ->
    Meteor.subscribe 'posts'
    # Meteor.subscribe 'posts', 'Paul'   # INFO: to limit to author: 'Paul', if the function has been set in the publication
)
Router.map ->
  @route 'postsList',   { path: '/' }
  @route 'postPage',    { 
                          path: '/posts/:_id'
                          data: -> Posts.findOne(@params._id)
                        }
  @route 'postEdit',    {
                          path: '/posts/:_id/edit'
                          data: -> Posts.findOne(this.params._id)
                        }
  @route 'postSubmit',  { path: '/submit-new-post' }

requireLogin = (pause) ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render 'accessDenied'
    pause()

Router.onBeforeAction 'loading'
Router.onBeforeAction requireLogin, {only: 'postSubmit'}
Router.onBeforeAction -> Errors.clearSeen()