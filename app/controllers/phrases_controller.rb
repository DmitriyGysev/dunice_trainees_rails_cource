class PhrasesController < ApplicationController
  before_filter :normalize_params, only: [:edit, :create]
  before_action :set_phrase!, only: [:edit, :update, :destroy, :show, :vote]
  before_filter :check_user!, only: [:edit, :update, :destroy]
  before_filter :check_user_before_example_deletion!, only: [:delete_example]

  def index
    @phrases = Phrase.includes(:user).paginate(:page => params[:page])
  end

  def new
    @phrase = Phrase.new
    @phrase.examples.build(:user_id => current_user.id)
  end

  def show
    @examples = @phrase.examples.includes(:user).paginate(:page => params[:page])
    @example = @phrase.examples.build(:user_id => current_user.id)
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

  def create_example
    @example = @phrase.examples.new(example_params)
    if @example.save
      flash[:notice] = 'Example has been created!'
    else
      flash[:danger] = @example.errors.full_messages.to_sentence
    end
    redirect_to phrase_path
  end

  def vote
    shared_vote(@phrase)
    redirect_to(:back)
  end

  private

  def normalize_params
    params[:phrase][:category] = params[:phrase][:category].to_i
  end

  def phrase_params
    params.require(:phrase).permit(:phrase, :category, :translation, examples_attributes: [ :example, :user_id, :_destroy ])
  end

  def set_phrase!
    @phrase = Phrase.friendly.find(params[:id])
  end

  def check_user!
    unless @phrase.is_author? current_user
      flash[:danger] = 'You don\'t author of phrase, go away!'
      redirect_to(:back)
    end
  end

end
