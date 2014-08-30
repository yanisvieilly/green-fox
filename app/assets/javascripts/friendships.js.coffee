$ ->
  removeListItem = (e) -> $(e.target).closest('li').remove()

  $('.accept-request').on 'ajax:success', (e, data) ->
    $.get "/users/#{data.requester_id}"
    $(e.target).closest('li').remove()

  $('.decline-request').on 'ajax:success', removeListItem

  $('.delete-friendship').on 'ajax:success', removeListItem
