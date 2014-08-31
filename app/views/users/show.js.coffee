$('ul#friends').prepend "<%=j render partial: 'show', locals: { user: @user, search: false } %>"
