$('#friend-search-result').html ''
<% @users.each do |user| %>
$('#friend-search-result').append "<%=j render partial: 'show', locals: { user: user } %>"
<% end %>
