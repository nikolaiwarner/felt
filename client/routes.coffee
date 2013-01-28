Meteor.Router.add
  '/': ->'root'
  '/chrome/add_feeling': 'chrome/add_feeling'
  '/chrome/options': 'chrome/options'
  '/chrome': 'chrome'
  '*': ->
    console.warn 'not_found'
    'not_found'
