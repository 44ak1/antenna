module AdminHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = type.to_sym
      next unless [:notice, :alert].include?(type)
      type = :success  if type == :notice
      type = :danger  if type == :alert
      text = content_tag(:div, link_to("&times;".html_safe, "#", class: "close", "data-dismiss" => "alert") + message, class: "alert alert-block in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end
end
