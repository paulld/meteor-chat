Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault()
    post = {
      url: $(e.target).find('[name=url]').val()
      title: $(e.target).find('[name=title]').val()
      author: $(e.target).find('[name=author]').val()
      category: $(e.target).find('[name=category]').val()
      description: $(e.target).find('[name=description]').val()
      message: $(e.target).find('[name=message]').val()
      flag: false
    }
    post._id = Posts.insert(post)
    Router.go('postPage', post)