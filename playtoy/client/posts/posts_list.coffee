Template.postsList.helpers
  posts: ->
    # INFO: loads all the fields but limits to the post whose category is Portfolio:
    # Posts.find( {category: 'Portfolio'} )

    #  INFO: if we don't want to load certin fields:
    Posts.find( {category: 'Portfolio'},
                {fields: {
                  description: false
                  }
                }
              )