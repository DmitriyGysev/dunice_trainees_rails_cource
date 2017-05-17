class Phrase < ActiveRecord::Base
  include SharedMethods
  include PublicActivity::Model
  extend FriendlyId

  CATEGORIES = [['Actions', 0], ['Time', 1], ['Productivity', 2], ['Apologies', 3], ['Common', 4]]
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy

  belongs_to :user
  has_many   :examples, dependent: :destroy
  accepts_nested_attributes_for :examples, allow_destroy: true

  friendly_id :phrase, use: :slugged
  acts_as_votable

  validates :translation, :phrase, :user_id, presence: true
  validates :phrase, uniqueness: true
  validates :category,
            inclusion: {
                in: %w(Actions Time Productivity Apologies),
                message: "%{value} is not a valid categoty"
            }

  enum category: %w(Actions Time Productivity Apologies)



end
