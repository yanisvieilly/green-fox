$ ->
  $('.accept-request').on 'ajax:success', (e, data) ->
    $.get "/users/#{data.requester_id}"
    $(e.target).closest('li').remove()
