# Local (client-only) collection !
# the collection name is set to null
@Errors = new Meteor.Collection(null)

# create a method available on the client-side:
throwError = (message) ->
  Errors.insert {message: message}
