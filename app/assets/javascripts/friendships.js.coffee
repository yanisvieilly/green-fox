$ ->
  removeListItem = (e) -> $(e.target).closest('li').remove()

  # When the friend request is accepted, add the new friend to the user friends list
  $('.accept-request').on 'ajax:success', (e, data) ->
    $.get "/users/#{data.requester_id}"
    $(e.target).closest('li').remove()

  # When the friend request is declined, remove it
  $('.decline-request').on 'ajax:success', removeListItem

  # When a friendship is removed, remove the friend from the list
  $('ul#friends').on 'ajax:success', '.delete-friendship', removeListItem


  # Timeout to prevent a request on each keystroke
  timeout = null
  $('#friend-search').on 'keyup', ->
    clearTimeout timeout
    timeout = setTimeout(
      => $.get "/users/search?q=#{$(@).val()}"
      300
    )
