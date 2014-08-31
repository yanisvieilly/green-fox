module RequestsHelper
  def requests_list_item(request)
    content_tag(:li, class: 'list-group-item') do
      concat content_tag(:strong, request.requester.nickname)
      concat ' '
      concat content_tag(:small, request.requester.name)
      concat link_to 'Decline', request_path(request), method: :delete, remote: true, class: 'btn btn-xs btn-danger pull-right decline-request'
      concat link_to 'Accept', request_path(request), method: :patch, remote: true, class: 'btn btn-xs btn-success pull-right accept-request'
    end
  end
end
