Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault()
    post = {
      url: $(e.target).find('[name=url]').val()
      title: $(e.target).find('[name=title]').val()
      category: $(e.target).find('[name=category]').val()
      message: $(e.target).find('[name=message]').val()
      flag: false
    }

    Meteor.call 'post', post, (error, id) ->
      if error
        return alert error.reason
      else
        Router.go 'postPage', {_id: id}
