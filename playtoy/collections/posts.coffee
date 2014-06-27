@Posts = new Meteor.Collection('posts')

Posts.allow
  update: ownsDocument
  remove: ownsDocument
  # INFO: allow insert not usefull anymore because we handle the user check below
  # insert: (userId, doc) ->
#     # only allow posting if you are logged in
#     !! userId

Posts.deny
  update: (userId, post, fieldNames) ->
    # may only edit the following two fields:
    _.without( fieldNames, 'url', 'title', 'category' ).length > 0

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = Posts.findOne({url: postAttributes.url})
    
    # ensure the user is logged in
    unless user
      throw new Meteor.Error 401, "You need to be logged in to post new stories."
  
    # ensure the post has a title
    unless postAttributes.title
      throw new Meteor.Error 422, 'Please fill in a headline.'
  
    # check that there are no previous posts with the same link
    if postAttributes.url && postWithSameLink
      throw new Meteor.Error 302,
        'This link has already been posted',
        postWithSameLink._id
  
    # pick out the whitelisted keys
    post = _.extend(_.pick(postAttributes, 'url', 'title', 'message', 'category', 'flag'),
      userId: user._id,
      author: user.username,
      submitted: new Date().getTime()
    )
    
    postId = Posts.insert post    
    postId


# TODO: what to do with http:// ??
# TODO: check domain names rather than urls? what if /, http, https...