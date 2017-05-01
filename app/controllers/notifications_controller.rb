class NotificationsController < ApplicationController

  def index
    @notifications = PublicActivity::Activity.where(recipient_id: current_user.id)
  end

  def read_all
    PublicActivity::Activity.where(recipient_id: current_user.id).update_all({readed: true})
    render :nothing => true
  end

end
