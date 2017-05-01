module SharedMethods
  extend ActiveSupport::Concern

  def is_author?(user)
    self.user == user
  end

end