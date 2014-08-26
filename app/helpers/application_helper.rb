module ApplicationHelper
  def flash_bootstrap_class(type)
    case type
    when 'notice' then 'alert alert-info'
    when 'alert' then 'alert alert-warning'
    end
  end

  def flash_helper
    flash_blocks = flash.collect do |type, message|
      content_tag(:div, message, class: flash_bootstrap_class(type))
    end
    flash_blocks.join.html_safe
  end
end
