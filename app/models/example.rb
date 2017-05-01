class Example < ActiveRecord::Base
  include SharedMethods

  belongs_to :phrase
  belongs_to :user

  acts_as_votable

  validates :example, presence: true
end
