class ExamplesController < ApplicationController
  before_action :set_phrase!, only: [:create, :destroy, :vote]
  before_action :set_example!, only: [:destroy, :vote]

  def create
    @example = @phrase.examples.new(example_params)
    if @example.save
      flash[:notice] = 'Example has been created!'
    else
      flash[:danger] = @example.errors.full_messages.to_sentence
    end
    redirect_to phrase_path(@phrase)
  end

  def destroy
    @example.destroy
    flash[:notice] = 'Example has been deleted!'
    redirect_to phrase_path(@phrase)
  end

  def vote
    shared_vote(@example)
    redirect_to(:back)
  end

  private

  def example_params
    params.require(:example).permit(:example, :user_id)
  end

  def set_phrase!
    @phrase = Phrase.friendly.find(params[:phrase_id])
  end

  def set_example!
    @example = @phrase.examples.find_by(id: params[:example_id])
  end

end
