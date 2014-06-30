Template.postsList.helpers
  posts: ->
    # INFO: loads all the fields but limits to the post whose category is Portfolio:
    # Posts.find( {category: 'Portfolio'} )

    #  INFO: if we don't want to load certin fields, or want to limit to certain parameters:
    # Posts.find {category: 'Portfolio'}, {fields: {message: false}},
    #   sort:
    #     submitted: -1

    # Show all, sort descending:
    Posts.find {},              # INFO: acts a the curser over which {{#each}} will iterate
      sort:
        submitted: -1
