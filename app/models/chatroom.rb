class Chatroom < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  has_many :messages, dependent: :destroy

  def chatter(c_user)
    owner == c_user ? recipient.username : owner.username
  end
end
