$ ->
  $('.accept-request').on 'ajax:success', (e, data) ->
    $.get "/users/#{data.requester_id}"
    $(e.target).closest('li').remove()

  $('.delete-friendship').on 'ajax:success', (e, data) ->
    $(e.target).closest('li').remove()
