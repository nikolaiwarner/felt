Feelings.allow
  insert: (userId, doc) ->
    # the user must be logged in, and the document must be owned by the user
    userId && doc.userId == userId

  update: (userId, docs, fields, modifier) ->
    # can only change your own documents
    _.all docs, (doc) ->
      doc.userId == userId

  remove: (userId, docs) ->
    # can only remove your own documents
    _.all docs, (doc) ->
      doc.userId == userId

  fetch: ['userId']


reset = ->
  Feelings.remove {}
