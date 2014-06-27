# Meteor.subscribe 'posts', 'Paul'
# INFO: subscription is now handled in the router



Meteor.startup(->
  Deps.autorun(->
    console.log('There are ' + Posts.find().count() + ' posts')
  )
)