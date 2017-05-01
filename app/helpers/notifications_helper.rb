module NotificationsHelper

  def readed_circle(notification)
    class_name = notification.readed ? 'readed' : ''
    "<span class='glyphicon glyphicon-heart notification-item #{class_name}'></span>".html_safe
  end

end

