Errors = {
  // Local (client-only) collection
  // the collection name is set to null
  collection: new Meteor.Collection(null),

// create 2 methods available on the client-side:
  throw: function(message) {
    Errors.collection.insert({message: message, seen: false})
  },

  clearSeen: function() {
    Errors.collection.remove({seen: true});
  }
};