Feelings = new Meteor.Collection("feelings")

user_logged_in = ->
  (Meteor.userId())
