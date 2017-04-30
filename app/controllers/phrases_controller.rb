class PhrasesController < ApplicationController
  before_action :set_phrase!, only: [:edit, :update, :destroy]
  before_filter :check_user!, only: [:edit, :update, :destroy]

  def index
    @phrases = Phrase.includes(:user).paginate(:page => params[:page])
  end

  def new
    @phrase = Phrase.new()
  end

  def edit
  end

  def update
    if @phrase.update_attributes(phrase_params)
      flash[:notice] = 'Phrase has been updated!'
      redirect_to user_path(@phrase.user)
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :edit
    end
  end

  def create
    @phrase = current_user.phrases.new(phrase_params)
    if @phrase.save
      flash[:notice] = 'Phrase has been created!'
      redirect_to root_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @phrase.destroy
    flash[:notice] = 'Phrase has been deleted!'
    redirect_to user_path(@phrase.user)
  end

  private

  def phrase_params
    params.require(:phrase).permit(:phrase, :translation)
  end

  def set_phrase!
    @phrase = Phrase.find_by(id: params[:id])
  end

  def check_user!
    unless @phrase.author? current_user
      flash[:danger] = 'You don\'t author of phrase, go away!'
      redirect_to(:back)
    end
  end
end
