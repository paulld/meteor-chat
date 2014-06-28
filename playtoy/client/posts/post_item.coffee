Template.postItem.helpers
  ownPost: ->
    @userId == Meteor.userId()
  domain: ->
    a = document.createElement('a')
    a.href = @url
    a.hostname
  # hasMessage: ->
  #   @message != null

  # Not necessary anymore since we denormalized commentsCount and included it as a filed in Posts:
  # commentsCount: ->
  #   Comments.find({postId: this._id}).count()