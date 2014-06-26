Template.layout.helpers
  pageTitle: ->
    Session.get 'pageTitle'
  Session.set 'pageTitle', 'My Blog'

# This is just to show that Session params can be available throughout the App. Not necessary otherwise
# We can then call {{pageTitle}} anywhere in the App, since the session params are available everywhere
