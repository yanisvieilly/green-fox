module FriendshipsHelper
  def friends_list_item(friend)
    content_tag(:li, class: 'list-group-item') do
      content_tag(:div, class: 'row') do
        content_tag(:div, class: 'col-md-10') do
          content_tag(:h4, class: 'list-group-heading') do
            concat content_tag(:strong, friend.nickname)
            concat ' '
            concat content_tag(:small, friend.name)
          end +
          content_tag(:p, class: 'list-group-item-text') do
            concat friend.description
            concat tag(:br)
            concat content_tag(:em, friend.location)
          end
        end +
        content_tag(:div, class: 'col-md-2') do
          link_to 'Remove', friendship_path(friend), method: :delete, remote: true, class: 'btn btn-danger delete-friendship'
        end
      end
    end
  end
end
