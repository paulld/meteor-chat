Template.postSubmit.events
  
  'submit form': (e) ->
    e.preventDefault()

    post =
      url: $(e.target).find('[name=url]').val()
      title: $(e.target).find('[name=title]').val()
      category: $(e.target).find('[name=category]').val()
      message: $(e.target).find('[name=message]').val()

    Meteor.call 'post', post, (error, id) ->
      if error
        Errors.throw(error.reason)

        if error.error is 302
          Router.go 'postPage',
            _id: error.details

      else
        Router.go 'postPage',
          _id: id
