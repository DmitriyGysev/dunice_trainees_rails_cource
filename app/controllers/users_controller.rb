class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @phrases = @user.phrases
  end

  def index
    @users = User.order(carma: :desc).paginate(:page => params[:page])
  end

end
