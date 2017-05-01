class Example < ActiveRecord::Base
  include SharedMethods
  include PublicActivity::Model

  belongs_to :phrase
  belongs_to :user

  acts_as_votable

  validates :example, presence: true
  validates_uniqueness_of :example, scope: :phrase_id, :message=>"has already been used!"
end
