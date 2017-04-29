class Phrase < ActiveRecord::Base
  validates :translation, :phrase, presence: true
end
