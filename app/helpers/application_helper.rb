module ApplicationHelper
  def flash_bootstrap_class(type)
    class_name = case type
      when 'notice' then 'info'
      when 'alert' then 'warning'
      end
    "alert alert-#{class_name} alert-dismissible"
  end

  def flash_helper
    flash_blocks = flash.collect do |type, message|
      content_tag(:div, class: flash_bootstrap_class(type)) do
        content_tag(:button, '&times;'.html_safe, data: { dismiss: 'alert' }, class: 'close') + message
      end
    end
    flash_blocks.join.html_safe
  end
end
