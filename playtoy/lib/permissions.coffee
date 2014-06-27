# check that the userId specified owns the documents
@ownsDocument = (userId, doc) ->
  doc && doc.userId is userId

# INFO: BE CAREFUL TO ADD @ TO MAKE ownsDocument AVAILABLE THROUGHOUT THE APP!