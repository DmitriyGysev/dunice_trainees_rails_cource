class Example < ActiveRecord::Base
  include SharedMethods

  belongs_to :phrase
  belongs_to :user

  validates :example, presence: true
end
