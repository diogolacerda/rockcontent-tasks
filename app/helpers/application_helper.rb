module ApplicationHelper
  def flash_message
    messages = ""
    [:info, :error].each { |type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }

    messages
  end
end
