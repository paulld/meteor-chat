# This is errors helper
Template.errors.helpers
  errors: ->
    Errors.find()

# This is the error helper. we can put both on the same file because they're short
# "rendered" means that this will only be actionned AFTER the error template has ben rendered --> defer
Template.error.rendered = ->
  error = @data
  Meteor.defer ->
    Errors.update error._id, {$set: {seen: true}}
