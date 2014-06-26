Meteor.publish 'posts', (author) ->
  Posts.find({ flag: false, author: author })