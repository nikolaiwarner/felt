format_dates = ->
  $('.date').each (index, element) =>
    $(element).html(moment.unix($(element).data('date')).format('MMMM Do YYYY, h:mm:ss a'))


# feelings_list
your_feelings = ->
  Feelings.find {userId: Meteor.userId()}, {sort: {date: -1}}

Template.feelings_list.feelings = ->
  your_feelings()

Template.feelings_list.visible = ->
  user_logged_in()

Template.feelings_list.rendered = ->
  format_dates()


# new_feeling form

Template.new_feeling.visible = ->
  user_logged_in()

Template.new_feeling.rendered = ->
  in_a_word_autocomplete()
  in_a_word_autocomplete()

Template.new_feeling.events
  "click #save": ->

    data =
      date: moment().unix()
      userId: Meteor.userId()
      value: parseInt($('.feeling_value input:checked').val(), 10)

    if in_a_word = $('#in_a_word').val()
      data.in_a_word = in_a_word

    if description = $('.description').val()
      data.description = description

    console.log data
    Feelings.insert data




in_a_words = ->
  your_feelings().map (feeling) ->
    feeling.in_a_word

in_a_word_autocomplete = ->
  $('#in_a_word').autocomplete
    source: in_a_words()

