class User < ActiveRecord::Base
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :uid, :provider, :nickname, presence: true
  validates :nickname, uniqueness: true
end
