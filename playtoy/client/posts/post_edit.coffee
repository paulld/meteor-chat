Template.postEdit.events

  'submit form': (e) ->
    e.preventDefault()

    currentPostId = @_id
    
    postProperties =
      url: $(e.target).find('[name=url]').val()
      title: $(e.target).find('[name=title]').val()
      category: $(e.target).find('[name=category]').val()

    Posts.update currentPostId,
      $set: postProperties,       # TODO: what does this line do ??
      (error) ->
        if (error)
          # display the error to the user
          Errors.throw(error.reason)
        else
          Router.go 'postPage',
            _id: currentPostId
  
  'click .delete': (e) ->
    e.preventDefault()

    if confirm "Delete this post?"
      currentPostId = @_id
      Posts.remove currentPostId
      Router.go 'postsList'
