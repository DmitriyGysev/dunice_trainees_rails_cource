class PhrasesController < ApplicationController
  def index
    @phrases = Phrase.paginate(:page => params[:page])
  end

  def new
    @phrase = Phrase.new()
  end

  def create
    @phrase = Phrase.new(phrase_params)
    if @phrase.save
      flash[:notice] = 'Phrase has been created'
      redirect_to phrases_path
    else
      flash[:danger] = @phrase.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def phrase_params
    params.require(:phrase).permit(:phrase, :translation)
  end
end
