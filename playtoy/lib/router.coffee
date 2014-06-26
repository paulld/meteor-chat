Router.configure(
  layoutTemplate: 'layout'
  loadingTemplate: 'loading',
  waitOn: ->
    Meteor.subscribe 'posts', 'Paul'
)
Router.map ->
  @route 'postsList', {path: '/'}

Router.onBeforeAction('loading')