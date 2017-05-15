class ChatroomsController < ApplicationController
  before_action :set_chatroom!, only: :show
  before_filter :check_user!, only: :show

  def index
    @chatrooms = Chatroom.where("owner_id = #{current_user.id} OR recipient_id = #{current_user.id}")
  end

  def new
    ids = "(#{params[:recipient_id]}, #{current_user.id})"
    chatroom = Chatroom.find_by("recipient_id IN #{ids} AND owner_id IN #{ids}")
    unless chatroom.present?
      chatroom = Chatroom.create({owner_id: current_user.id, recipient_id: params[:recipient_id]})
    end
    redirect_to chatroom_path(id: chatroom.id)
  end

  def show
    @message = Message.new
  end

  private

  def set_chatroom!
    @chatroom = Chatroom.find_by(id: params[:id])
  end

  def check_user!
    unless @chatroom.owner == current_user || @chatroom.recipient == current_user
      flash[:danger] = 'Dude, it\'s not your chatroom'
      redirect_to root_path
    end
  end
end
