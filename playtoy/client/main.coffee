# Meteor.subscribe 'posts', 'Paul'
# INFO: subscription is now handled in the router



Meteor.startup(->
  Deps.autorun(->
    console.log('There are ' + Posts.find().count() + ' posts')
  )
)

# INFO: console logs the number of posts seen on client side, + autoruns everytime this number changes
