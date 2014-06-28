# INFO: will only publish posts that are not flagged (flag: false) 
Meteor.publish 'posts', ->
  Posts.find( {flag: false} )

# INFO: possibility to put restrictions on the author (cf. subscription)
# Meteor.publish 'posts', (author) ->
  # Posts.find({ flag: false, author: author })

Meteor.publish 'comments', (postId) ->
  Comments.find( {postId: postId} )

Meteor.publish 'notifications', ->
  Notifications.find()
