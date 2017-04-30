class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @phrases = @user.phrases
  end

  def index
    @users = User.paginate(:page => params[:page])
  end

end
