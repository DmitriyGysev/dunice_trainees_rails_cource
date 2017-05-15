class User < ActiveRecord::Base
  include PublicActivity::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :phrases
  has_many :examples
  has_many :messages
  has_many :chatrooms, through: :messages


  validates :username, presence: true
  validates :username, uniqueness: true

  def has_new_notifications?
    PublicActivity::Activity.where(recipient_id: self.id, readed: false).any?
  end
end
