$('#requests').html ''
<% @requests.each do |request| %>
$('#requests').append "<%=j render partial: 'show', locals: { request: request } %>"
<% end %>
