$ ->
  displayError = (e, xhr, status, error) -> window.createFlash error, 'danger'

  displaySuccess = (e, message) ->
    $(e.target).closest('li').remove()
    window.createFlash message

  # When the friend request is accepted, add the new friend to the user friends list
  $('.accept-request')
    .on 'ajax:success', (e, data) ->
      $.get "/users/#{data.requester_id}"
      displaySuccess e, 'Friend request was successfully accepted'
    .on 'ajax:error', displayError

  # When the friend request is declined, remove it
  $('.decline-request')
    .on 'ajax:success', (e) -> displaySuccess e, 'Friend request was successfully declined'
    .on 'ajax:error', displayError

  # When a friendship is removed, remove the friend from the list
  $('ul#friends')
    .on 'ajax:success', '.delete-friendship', (e) -> displaySuccess e, 'Friend was successfully removed'
    .on 'ajax:error', '.delete-friendship', displayError


  # Timeout to prevent a request on each keystroke
  timeout = null
  $('#friend-search').on 'keyup', ->
    clearTimeout timeout
    timeout = setTimeout(
      =>
        $.get("/users/search", q: $(@).val())
          .fail (xhr, status, error) -> window.createFlash error, 'danger'
      300
    )

  # When a friend request is sent, remove the friend from the search results
  $('#friend-search-result')
    .on 'ajax:success', '.add-friendship', (e) -> displaySuccess e, 'A friend request has been sent to this user'
    .on 'ajax:error', '.add-friendship', displayError
