Template.postsList.helpers
  posts: ->
    Posts.find( {category: 'Portfolio'},
                {fields: {
                  description: false
                  }
                }
              )