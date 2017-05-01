class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :phrases
  has_many :examples

  validates :username, presence: true
  validates :username, uniqueness: true
end
