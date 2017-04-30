class Phrase < ActiveRecord::Base
  CATEGORIES = [['Actions', 0], ['Time', 1], ['Productivity', 2], ['Apologies', 3], ['Common', 4]]

  belongs_to :user

  validates :translation, :phrase, presence: true
  validates :phrase, uniqueness: true
  validates :category,
            inclusion: {
                in: %w(Actions Time Productivity Apologies),
                message: "%{value} is not a valid categoty"
            }

  enum category: %w(Actions Time Productivity Apologies)

  def author?(user)
    self.user == user
  end

end
