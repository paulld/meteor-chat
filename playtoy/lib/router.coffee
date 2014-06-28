Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading',
  waitOn: ->
    [Meteor.subscribe('posts'), Meteor.subscribe('notifications')]
    # Meteor.subscribe 'posts', 'Paul'   # INFO: to limit to author: 'Paul', if such function has been set in the publication

Router.map ->
  @route 'postsList',   { path: '/' }
  @route 'postPage',    { 
                          path: '/posts/:_id'
                          waitOn: -> Meteor.subscribe 'comments', @params._id
                          data: -> Posts.findOne @params._id
                        }
  @route 'postEdit',    {
                          path: '/posts/:_id/edit'
                          data: -> Posts.findOne @params._id
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