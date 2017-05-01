module ExamplesHelper

  def show_example_delete_link?(example)
    example.is_author?(current_user) || example.phrase.is_author?(current_user)
  end

end
